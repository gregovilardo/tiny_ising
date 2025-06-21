/*
 * Tiny Ising model.
 * Loosely based on  "q-state Potts model metastability
 * study using optimized GPU-based Monte Carlo algorithms",
 * Ezequiel E. Ferrero, Juan Pablo De Francesco, Nicolás Wolovick,
 * Sergio A. Cannas
 * http://arxiv.org/abs/1101.0876
 *
 * Debugging: Ezequiel Ferrero
 */
#include <cuda.h>
#include <cuda_runtime.h>
#include <curand_kernel.h>
#include <device_launch_parameters.h>

#include "ising.h"
#include "params.h"
#include "wtime.h"

#include <assert.h>
#include <limits.h> // UINT_MAX
#include <math.h>   // expf()
#include <stdio.h>  // printf()
#include <stdlib.h> // rand()
#include <time.h>   // time()

// Internal definitions and functions
// out vector size, it is +1 since we reach TEMP_
#define NPOINTS (1 + (int)((TEMP_FINAL - TEMP_INITIAL) / TEMP_DELTA))
#define N (L * L)         // system size
#define SEED (time(NULL)) // random seed
#define threadsPerBlock 256
#define numBlocks 4

// temperature, E, E^2, E^4, M, M^2, M^4
struct statpoint {
  double t;
  double e;
  double e2;
  double e4;
  double m;
  double m2;
  double m4;
};

static void cycle(int *d_grid, size_t pitch, const double min, const double max,
                  const double step, const unsigned int calc_step,
                  struct statpoint stats[]) {

  assert((0 < step && min <= max) || (step < 0 && max <= min));
  int modifier = (0 < step) ? 1 : -1;

  curandState *d_state;
  gpuErrchk(cudaMalloc((void **)&d_state, L * sizeof(curandState)));
  set_state_curand<<<1, threadsPerBlock>>>(d_state, 1234ULL);

  unsigned int index = 0;
  for (double temp = min; modifier * temp <= modifier * max; temp += step) {

    // equilibrium phase
    for (unsigned int j = 0; j < TRAN; ++j) {
      update<<<numBlocks, threadsPerBlock>>>(temp, d_grid, pitch, d_state, 0);
      gpuErrchk(cudaPeekAtLastError());
      gpuErrchk(cudaDeviceSynchronize());
      update<<<numBlocks, threadsPerBlock>>>(temp, d_grid, pitch, d_state, 1);
      gpuErrchk(cudaPeekAtLastError());
      gpuErrchk(cudaDeviceSynchronize());
    }

    // measurement phase
    unsigned int measurements = 0;
    double e = 0.0, e2 = 0.0, e4 = 0.0, m = 0.0, m2 = 0.0, m4 = 0.0;
    for (unsigned int j = 0; j < TMAX; ++j) {
      update<<<numBlocks, threadsPerBlock>>>(temp, d_grid, pitch, d_state, 0);
      gpuErrchk(cudaPeekAtLastError());
      gpuErrchk(cudaDeviceSynchronize());
      update<<<numBlocks, threadsPerBlock>>>(temp, d_grid, pitch, d_state, 1);
      gpuErrchk(cudaPeekAtLastError());
      gpuErrchk(cudaDeviceSynchronize());
      if (j % calc_step == 0) {
        double mag = 0.0;
        double *energy;
        int *M_max;
        gpuErrchk(cudaMallocManaged(&M_max, sizeof(int)));
        gpuErrchk(cudaMallocManaged(&energy, sizeof(double)));
        calculate<<<numBlocks, threadsPerBlock>>>(d_grid, pitch, M_max, energy);
        gpuErrchk(cudaPeekAtLastError());
        gpuErrchk(cudaDeviceSynchronize());
        mag = abs(*M_max) / (float)N;
        e += *energy;
        e2 += *energy * *energy;
        e4 += *energy * *energy * *energy * *energy;
        m += mag;
        m2 += mag * mag;
        m4 += mag * mag * mag * mag;
        ++measurements;
      }
    }
    assert(index < NPOINTS);
    stats[index].t = temp;
    stats[index].e += e / measurements;
    stats[index].e2 += e2 / measurements;
    stats[index].e4 += e4 / measurements;
    stats[index].m += m / measurements;
    stats[index].m2 += m2 / measurements;
    stats[index].m4 += m4 / measurements;
    ++index;
  }
}

__global__ static void init(int *d_grid, size_t pitch) {
  // for (unsigned int i = 0; i < L; ++i) {
  int i = threadIdx.x;
  if (i >= L)
    return;
  for (unsigned int j = 0; j < L; ++j) {
    int *grid_i_j = (int *)((char *)d_grid + i * pitch) + j;
    *grid_i_j = 1;
  }
}

int main(void) {
  // parameter checking
  static_assert(TEMP_DELTA != 0, "Invalid temperature step");
  static_assert(((TEMP_DELTA > 0) && (TEMP_INITIAL <= TEMP_FINAL)) ||
                    ((TEMP_DELTA < 0) && (TEMP_INITIAL >= TEMP_FINAL)),
                "Invalid temperature range+step");
  static_assert(
      TMAX % DELTA_T == 0,
      "Measurements must be equidistant"); // take equidistant calculate()
  static_assert(
      (L * L / 2) * 4ULL < UINT_MAX,
      "L too large for uint indices"); // max energy, that is all spins are the
                                       // same, fits into a ulong

  // the stats
  struct statpoint stat[NPOINTS];
  for (unsigned int i = 0; i < NPOINTS; ++i) {
    stat[i].t = 0.0;
    stat[i].e = stat[i].e2 = stat[i].e4 = 0.0;
    stat[i].m = stat[i].m2 = stat[i].m4 = 0.0;
  }

  // print header
  printf("# L: %i\n", L);
  printf("# Minimum Temperature: %f\n", TEMP_INITIAL);
  printf("# Maximum Temperature: %f\n", TEMP_FINAL);
  printf("# Temperature Step: %.12f\n", TEMP_DELTA);
  printf("# Equilibration Time: %i\n", TRAN);
  printf("# Measurement Time: %i\n", TMAX);
  printf("# Data Acquiring Step: %i\n", DELTA_T);
  printf("# Number of Points: %i\n", NPOINTS);

  // configure RNG
  srand(SEED);

  // start timer
  double start = wtime();

  int *d_grid;
  size_t pitch;
  // Allocates at least width (in bytes) * height bytes of linear memory on the
  // device and returns in *devPtr a pointer to the allocated memory.
  // The pitch returned in *pitch by cudaMallocPitch() is the width in bytes of
  // the allocation
  gpuErrchk(cudaMallocPitch((void **)&d_grid, &pitch, L * sizeof(int), L));
  // Given the row and column of an array element of type T, the address is
  // computed as:
  // T* pElement = (T*)((char*)BaseAddress + Row * pitch) + Column;

  // 2. Initialize to 0 (optional)
  gpuErrchk(cudaMemset2D(d_grid, pitch, 0, L * sizeof(int), L));
  init<<<numBlocks, threadsPerBlock>>>(d_grid, pitch);

  // dim3 blocks(1, 1);
  // dim3 threads(L, L);
  // kernel<<<blocks, threads>>>(d_grid, pitch, L);

  // temperature increasing cycle
  cycle(d_grid, pitch, TEMP_INITIAL, TEMP_FINAL, TEMP_DELTA, DELTA_T, stat);

  // stop timer
  double elapsed = wtime() - start;
  printf("# Total Simulation Time (sec): %lf\n", elapsed);

  printf("# Temp\tE\tE^2\tE^4\tM\tM^2\tM^4\n");
  for (unsigned int i = 0; i < NPOINTS; ++i) {
    printf("%lf\t%.10lf\t%.10lf\t%.10lf\t%.10lf\t%.10lf\t%.10lf\n", stat[i].t,
           stat[i].e / ((double)N), stat[i].e2 / ((double)N * N),
           stat[i].e4 / ((double)N * N * N * N), stat[i].m, stat[i].m2,
           stat[i].m4);
  }

  // 4. Free memory
  cudaFree(d_grid);

  return 0;
}
