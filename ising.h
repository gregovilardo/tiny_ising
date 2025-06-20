#include <cstdio>
#include <cuda.h>
#include <cuda_runtime.h>
#include <curand_kernel.h>
#include <device_launch_parameters.h>

#include "params.h"

static __global__ void set_state_curand(curandState *d_state,
                                        unsigned long seed) {
  int tid = threadIdx.x;
  curand_init(seed, tid, 0, &d_state[tid]);
}

#define gpuErrchk(ans)                                                         \
  {                                                                            \
    gpuAssert((ans), __FILE__, __LINE__);                                      \
  }
inline void gpuAssert(cudaError_t code, const char *file, int line,
                      bool abort = true) {
  if (code != cudaSuccess) {
    fprintf(stderr, "GPUassert: %s %s %d\n", cudaGetErrorString(code), file,
            line);
    if (abort)
      exit(code);
  }
}

__global__ void update(const float temp, int *d_grid, size_t pitch,
                       curandState *d_state);
__global__ void calculate(int *d_grid, size_t pitch, int *M_max, double *E);
