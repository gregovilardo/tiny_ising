#include "ising.h"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int tospin(int b) { return b == 0 ? -1 : 1; }

void update(const float temp, int grid[L][L / NBITS]) {
  const int bits = sizeof(int) * 8;
  const int L2 = L / NBITS;
  // typewriter update
  for (int i = 0; i < L; ++i) {
    for (int j = 0; j < L2; ++j) {
      int celd = grid[i][j];
      for (int b = bits - 1; b >= 0; b--) {
        int spin_old = tospin((celd >> b) & 1);
        int spin_new = (-1) * spin_old;

        // computing h_before
        /* int spin_neigh_n = grid[(i + L - 1) % L][j]; */
        /* int spin_neigh_e = grid[i][(j + 1) % L]; */
        /* int spin_neigh_w = grid[i][(j + L - 1) % L]; */
        /* int spin_neigh_s = grid[(i + 1) % L][j]; */
        int spin_neigh_n = tospin((grid[(i + L - 1) % L][j] >> b) & 1);
        int spin_neigh_s = tospin((grid[(i + 1) % L][j] >> b) & 1);

        int spin_neigh_e;
        if (b > 0) {
          spin_neigh_e = tospin((grid[i][j] >> (b - 1)) & 1);
        } else {
          int j_east = (j - 1 < 0) ? (L2 - 1) : (j - 1);
          spin_neigh_e = tospin((grid[i][j_east] >> (bits - 1)) & 1);
        }

        int spin_neigh_w;
        if (b < bits - 1) {
          spin_neigh_w = tospin((grid[i][j] >> (b + 1)) & 1);
        } else {
          int j_west = (j + 1 >= L2) ? 0 : (j + 1);
          spin_neigh_w = tospin((grid[i][j_west] >> 0) & 1);
        }

        int h_before = -(spin_old * spin_neigh_n) - (spin_old * spin_neigh_e) -
                       (spin_old * spin_neigh_w) - (spin_old * spin_neigh_s);

        // h after taking new spin
        int h_after = -(spin_new * spin_neigh_n) - (spin_new * spin_neigh_e) -
                      (spin_new * spin_neigh_w) - (spin_new * spin_neigh_s);

        int delta_E = h_after - h_before;
        float p = rand() / (float)RAND_MAX;
        if (delta_E <= 0 || p <= expf(-delta_E / temp)) {
          grid[i][j] = grid[i][j] ^ (1 << b);
        }
      }
    }
  }
}

double calculate(int grid[L][L / NBITS], int *M_max) {
  const int bits = sizeof(int) * 8;
  const int L2 = L / bits;
  int E = 0;
  for (int i = 0; i < L; ++i) {
    for (int j = 0; j < L2; ++j) {
      int celd = grid[i][j];
      for (int b = bits - 1; b >= 0; b--) {
        int spin = tospin((celd >> b) & 1);

        int spin_neigh_n = tospin((grid[(i + L - 1) % L][j] >> b) & 1);
        int spin_neigh_e = tospin((celd >> (b - 1 < 0 ? bits - 1 : b - 1)) & 1);
        int spin_neigh_w = tospin((celd >> (b + 1 > bits - 1 ? 0 : b + 1)) & 1);
        int spin_neigh_s = tospin((grid[(i + 1) % L][j] >> b) & 1);
        /* int spin_neigh_n = grid[(i + 1) % L][j]; */
        /* int spin_neigh_e = grid[i][(j + 1) % L]; */
        /* int spin_neigh_w = grid[i][(j + L - 1) % L]; */
        /* int spin_neigh_s = grid[(i + L - 1) % L][j]; */

        E += (spin * spin_neigh_n) + (spin * spin_neigh_e) +
             (spin * spin_neigh_w) + (spin * spin_neigh_s);
        *M_max += spin;
      }
    }
  }
  return -((double)E / 2.0);
}
