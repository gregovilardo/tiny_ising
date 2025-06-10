## CUDA-enabled Makefile

# CUDA compiler
NVCC      := nvcc

# Target architecture (adjust compute capability as needed)
ARCH      := sm_60


HOST_COMPILER := clang
# Host compiler flags (passed via -Xcompiler)
HOST_CFLAGS := -Wall -Wextra -mavx2 -O2 -fopenmp -march=native \
                 -funroll-loops -ffast-math 

# CUDA compiler flags
#
NVCCFLAGS := -ccbin /usr/bin/gcc-10 -arch=$(ARCH) -O2 -Xcompiler "$(HOST_CFLAGS)"

# Libraries
LDFLAGS  := -lm
GL_LDFLAGS := -lGL -lglfw

# Targets
TARGETS  := tiny_ising demo

# Default rule
all: $(TARGETS)

# Pattern rule: compile .cu to .o
%.o: %.cu
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

# Link tiny_ising
tiny_ising: tiny_ising.o ising.o xoshiro256plus.o
	$(NVCC) $(NVCCFLAGS) -o $@ $^ $(LDFLAGS)

# Link demo (with OpenGL)
demo: demo.o ising.o xoshiro256plus.o
	$(NVCC) $(NVCCFLAGS) -o $@ $^ $(LDFLAGS) $(GL_LDFLAGS)

# Clean up
clean:
	rm -f $(TARGETS) *.o

.PHONY: all clean

