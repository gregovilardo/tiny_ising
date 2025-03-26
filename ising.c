#include "ising.h"

#include <math.h>
#include <stdint.h>
#include <stdlib.h>

#define XOR32_MAX 4294967296.0f;

void update(const float temp, int grid[L][L]) {
  static uint32_t prng_state = 123456789; // Initial seed
  const float d = 1.0f / XOR32_MAX;
  // typewriter update
  for (unsigned int i = 0; i < L; ++i) {
    for (unsigned int j = 0; j < L; ++j) {
      int spin_old = grid[i][j];
      int spin_new = (-1) * spin_old;

      // computing h_before
      int spin_neigh_n = grid[(i + L - 1) % L][j];
      int spin_neigh_e = grid[i][(j + 1) % L];
      int spin_neigh_w = grid[i][(j + L - 1) % L];
      int spin_neigh_s = grid[(i + 1) % L][j];
      int h_before = -(spin_old * spin_neigh_n) - (spin_old * spin_neigh_e) -
                     (spin_old * spin_neigh_w) - (spin_old * spin_neigh_s);

      // h after taking new spin
      int h_after = -(spin_new * spin_neigh_n) - (spin_new * spin_neigh_e) -
                    (spin_new * spin_neigh_w) - (spin_new * spin_neigh_s);

      int delta_E = h_after - h_before;

      uint32_t x = prng_state;
      x ^= x << 13;
      x ^= x >> 17;
      x ^= x << 5;
      prng_state = x;

      float p = (float)x * d;
      if (delta_E <= 0 || p <= expf(-delta_E / temp)) {
        grid[i][j] = spin_new;
      }
    }
  }
}

double calculate(int grid[L][L], int *M_max) {
  int E = 0;
  for (unsigned int i = 0; i < L; ++i) {
    for (unsigned int j = 0; j < L; ++j) {
      int spin = grid[i][j];
      int spin_neigh_n = grid[(i + 1) % L][j];
      int spin_neigh_e = grid[i][(j + 1) % L];
      int spin_neigh_w = grid[i][(j + L - 1) % L];
      int spin_neigh_s = grid[(i + L - 1) % L][j];

      E += (spin * spin_neigh_n) + (spin * spin_neigh_e) +
           (spin * spin_neigh_w) + (spin * spin_neigh_s);
      *M_max += spin;
    }
  }
  return -((double)E / 2.0);
}
