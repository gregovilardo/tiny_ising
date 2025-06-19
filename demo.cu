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

#include <cuda_runtime.h>
#include <device_launch_parameters.h>

#include "colormap.h"
#include "gl2d.h"
#include "ising.h"
#include "params.h"
#include "wtime.h"

#include <assert.h>
#include <limits.h> // UINT_MAX
#include <stdio.h>  // printf()
#include <stdlib.h> // rand()
#include <string.h>
#include <time.h> // time()

#define MAXFPS 60
#define N (L * L)         // system size
#define SEED (time(NULL)) // random seed

/**
 * GL output
 */
static void draw(gl2d_t gl2d, float t_now, float t_min, float t_max,
                 int *d_grid, size_t pitch) {
  static double last_frame = 0.0;

  double current_time = wtime();
  if (current_time - last_frame < 1.0 / MAXFPS) {
    return;
  }
  last_frame = current_time;

  float row[L * 3];
  float color[3];
  colormap_rgbf(COLORMAP_VIRIDIS, t_now, t_min, t_max, &color[0], &color[1],
                &color[2]);
  for (int i = 0; i < L; ++i) {
    memset(row, 0, sizeof(row));
    for (int j = 0; j < L; ++j) {
      // T* pElement = (T*)((char*)BaseAddress + Row * pitch) + Column;
      int g = *((int *)((char *)d_grid + i * pitch) + j);
      if (g > 0) {
        row[j * 3] = color[0];
        row[j * 3 + 1] = color[1];
        row[j * 3 + 2] = color[2];
      }
    }
    gl2d_draw_rgbf(gl2d, 0, i, L, 1, row);
  }
  gl2d_display(gl2d);
}

static void cycle(gl2d_t gl2d, const double initial, const double final,
                  const double step, int *d_grid, size_t pitch) {
  assert((0 < step && initial <= final) || (step < 0 && final <= initial));
  int modifier = (0 < step) ? 1 : -1;

  for (double temp = initial; modifier * temp <= modifier * final;
       temp += step) {
    printf("Temp: %f\n", temp);
    for (unsigned int j = 0; j < TRAN + TMAX; ++j) {
      update<<<1, 1024>>>(temp, d_grid, pitch);
      draw(gl2d, temp, initial < final ? initial : final,
           initial < final ? final : initial, d_grid, pitch);
    }
  }
}

static void init(int grid[L][L]) {
  for (unsigned int i = 0; i < L; ++i) {
    for (unsigned int j = 0; j < L; ++j) {
      grid[i][j] = (rand() / (float)RAND_MAX) < 0.5f ? -1 : 1;
    }
  }
}

int main(void) {
  // parameter checking
  static_assert(TEMP_DELTA != 0, "Invalid temperature step");
  static_assert(((TEMP_DELTA > 0) && (TEMP_INITIAL <= TEMP_FINAL)) ||
                    ((TEMP_DELTA < 0) && (TEMP_INITIAL >= TEMP_FINAL)),
                "Invalid temperature range+step");
  static_assert(TRAN + TMAX > 0, "Invalid times");
  static_assert(
      (L * L / 2) * 4ULL < UINT_MAX,
      "L too large for uint indices"); // max energy, that is all spins are the
                                       // same, fits into a ulong

  // print header
  printf("# L: %i\n", L);
  printf("# Minimum Temperature: %f\n", TEMP_INITIAL);
  printf("# Maximum Temperature: %f\n", TEMP_FINAL);
  printf("# Temperature Step: %.12f\n", TEMP_DELTA);
  printf("# Equilibration Time: %i\n", TRAN);
  printf("# Measurement Time: %i\n", TMAX);

  // configure RNG
  srand(SEED);

  gl2d_t gl2d = gl2d_init("tiny_ising", L, L);

  // start timer
  double start = wtime();

  // clear the grid
  int *d_grid;
  size_t pitch;
  cudaMallocPitch((void **)&d_grid, &pitch, L * sizeof(int), L);
  cudaMemset2D(d_grid, pitch, 0, L * sizeof(int), L);

  // temperature increasing cycle
  cycle(gl2d, TEMP_INITIAL, TEMP_FINAL, TEMP_DELTA, d_grid, pitch);

  // stop timer
  double elapsed = wtime() - start;
  printf("# Total Simulation Time (sec): %lf\n", elapsed);

  gl2d_destroy(gl2d);

  return 0;
}
