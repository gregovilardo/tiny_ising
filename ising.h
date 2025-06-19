#include <cuda_runtime.h>
#include <device_launch_parameters.h>

#include "params.h"

__global__ void update(const float temp, int *d_grid, size_t pitch);
__global__ double calculate(int *d_grid, size_t pitch, int *M_max);
