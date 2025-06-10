#include "params.h"
#include <stddef.h>
void init_exp_table();
void update(const size_t index, int(*red_grid), int(*black_grid));
float calculate(int(*red_grid), int(*black_grid), int *M_max);
