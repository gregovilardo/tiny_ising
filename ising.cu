#include "ising.h"

#include <math.h>
#include <stdlib.h>

inline int get_value(int *d_grid, size_t pitch, int i, int j) {
  return *((int *)((char *)d_grid + i * pitch) + j);
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

    // h after taking new spin
    int h_after = -(spin_new * spin_n) - (spin_new * spin_e) -
                  (spin_new * spin_w) - (spin_new * spin_s);

    int delta_E = h_after - h_before;
    float p = rand() / (float)RAND_MAX;
    if (delta_E <= 0 || p <= expf(-delta_E / temp)) {
      int *grid_i_j = (int *)((char *)d_grid + i * pitch) + j;
      *grid_i_j = spin_new;
    }
  }
}

double calculate(int *d_grid, size_t pitch, int *M_max) {
  int E = 0;
  int i = threadIdx.x;
  // for (unsigned int i = 0; i < L; ++i) {
  for (unsigned int j = 0; j < L; ++j) {
    int spin = get_value(d_grid, pitch, i, j);
    int spin_n = get_value(d_grid, pitch, (i + L - 1) % L, j);
    int spin_e = get_value(d_grid, pitch, i, (j + 1) % L);
    int spin_w = get_value(d_grid, pitch, i, (j + L - 1) % L);
    int spin_s = get_value(d_grid, pitch, (i + 1) % L, j);

    E += (spin * spin_n) + (spin * spin_e) + (spin * spin_w) + (spin * spin_s);
    *M_max += spin;
  }
  return -((double)E / 2.0);
}
