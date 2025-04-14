#include "ising.h"

#include <math.h>
#include <stdint.h>
#include <stdlib.h>

#include "xoshiro256plus.h"

#define L_mask (L-1)

static float exp_table[32];

static void init_exp_table(float temp) {
  exp_table[(-8) + 8] = expf(-8 / temp);
  exp_table[(-4) + 8] = expf(-4 / temp);
  exp_table[(-2) + 8] = expf(-2 / temp);
  exp_table[(0) + 8] = expf(0 / temp);
  exp_table[(2) + 8] = expf(2 / temp);
  exp_table[(4) + 8] = expf(4 / temp);
  exp_table[(8) + 8] = expf(8 / temp);
}

void update(const float temp, int grid[L][L]) {

  static float last_temp = -999.0;

  if (temp != last_temp) {
    init_exp_table(temp);
    last_temp = temp;
  }
  // typewriter update
  for (unsigned int i = 0; i < L; ++i) {
    for (unsigned int j = 0; j < L; ++j) {
      int spin_old = grid[i][j];
      int spin_new = (-1) * spin_old;

      // computing h_before
      int spin_neigh_n = grid[(i + L - 1) & L_mask][j];
      int spin_neigh_e = grid[i][(j + 1) & L_mask];
      int spin_neigh_w = grid[i][(j + L - 1) & L_mask];
      int spin_neigh_s = grid[(i + 1) & L_mask][j];
      int sum_neighbors = spin_neigh_n + spin_neigh_e + spin_neigh_w + spin_neigh_s;
      int delta_E = 2 * spin_old * sum_neighbors; 

      float p = optimized_random_probability();
      if (delta_E <= 0 || p <= exp_table[-delta_E + 8]) {
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
      int spin_neigh_n = grid[(i + 1) & L_mask][j];
      int spin_neigh_e = grid[i][(j + 1) & L_mask];
      int spin_neigh_w = grid[i][(j + L - 1) & L_mask];
      int spin_neigh_s = grid[(i + L - 1) & L_mask][j];

      E += (spin * spin_neigh_n) + (spin * spin_neigh_e) +
           (spin * spin_neigh_w) + (spin * spin_neigh_s);
      *M_max += spin;
    }
  }
  return -((double)E / 2.0);
}
