#include "params.h"
#define NBITS (sizeof(int) * 8)

void update(const float temp, int grid[L][L / NBITS]);
double calculate(int grid[L][L / NBITS], int *M_max);
