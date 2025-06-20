#include "ising.h"

#include <cstdio>
#include <math.h>
#include <stdlib.h>

__device__ inline int get_value(int *d_grid, size_t pitch, int i, int j) {
  return *((int *)((char *)d_grid + i * pitch) + j);
}

__device__ unsigned int xor128() {
  // unsigned int x = seed + blockIdx.x * 123456789 + threadIdx.x * 987654321;
  unsigned int seed = threadIdx.x + blockIdx.x * blockDim.x;
  x ^= x << 13;
  x ^= x >> 17;
  x ^= x << 5;
  return x;
}

__global__ void update(const float temp, int *d_grid, size_t pitch) {
  // typewriter update
  int i = threadIdx.x;
  // for (unsigned int i = 0; i < L; ++i) {
  for (unsigned int j = 0; j < L; ++j) {
    int spin_old = get_value(d_grid, pitch, i, j);
    int spin_new = (-1) * spin_old;

    // computing h_before
    int spin_n = get_value(d_grid, pitch, (i + L - 1) % L, j);
    int spin_e = get_value(d_grid, pitch, i, (j + 1) % L);
    int spin_w = get_value(d_grid, pitch, i, (j + L - 1) % L);
    int spin_s = get_value(d_grid, pitch, (i + 1) % L, j);

    int h_before = -(spin_old * spin_n) - (spin_old * spin_e) -
                   (spin_old * spin_w) - (spin_old * spin_s);
    if (i == 4) {
      printf("spin_n: %d\n", spin_n);
      printf("spin_s: %d\n", spin_s);
      printf("spin_e: %d\n", spin_e);
      printf("spin_w: %d\n", spin_w);
    }

    // h after taking new spin
    int h_after = -(spin_new * spin_n) - (spin_new * spin_e) -
                  (spin_new * spin_w) - (spin_new * spin_s);

    int delta_E = h_after - h_before;
    // float p = rand() / (float)RAND_MAX;

    // int frame_seed = 0x912; // TODO: changue this
    unsigned int rand_int = xor128();
    float p = (rand_int & 0xFFFF) / 65535.0f;
    if (i == 4) {
      printf("p: %d\n", p);
      printf("delta_E: %d\n", delta_E);
    }

    if (delta_E <= 0 || p <= __expf(-delta_E / temp)) {

      printf("HOLA@\n");
      int *grid_i_j = (int *)((char *)d_grid + i * pitch) + j;
      *grid_i_j = spin_new;
    }
  }
}

__global__ void calculate(int *d_grid, size_t pitch, int *M_max, double *E) {
  *E = 0;
  int i = threadIdx.x;
  // for (unsigned int i = 0; i < L; ++i) {
  for (unsigned int j = 0; j < L; ++j) {
    int spin = get_value(d_grid, pitch, i, j);
    int spin_n = get_value(d_grid, pitch, (i + L - 1) % L, j);
    int spin_e = get_value(d_grid, pitch, i, (j + 1) % L);
    int spin_w = get_value(d_grid, pitch, i, (j + L - 1) % L);
    int spin_s = get_value(d_grid, pitch, (i + 1) % L, j);

    *E += (spin * spin_n) + (spin * spin_e) + (spin * spin_w) + (spin * spin_s);
    *M_max += spin;
  }
  *E = *E / 2.0;
}
