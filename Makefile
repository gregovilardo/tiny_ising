CC = icx
# CFLAGS +=  -Wall -Wextra -qopenmp -mavx2 -O2 -march=native  -fvectorize -funroll-loops -ffast-math
CFLAGS +=  -Wall -Wextra -mavx2 -O2 -march=native  -fvectorize -funroll-loops -ffast-math # sin OpenMP
LDFLAGS = -lgomp -lm 
OFLAGS = -ipo -flto
GL_LDFLAGS = -lGL -lglfw

# Files
TARGETS = tiny_ising demo

# Rules
all: $(TARGETS)

tiny_ising: tiny_ising.o ising.o xoshiro256plus.o
	$(CC) $(CFLAGS) $(OFLAGS) -o $@ $^ $(LDFLAGS)

demo: demo.o ising.o xoshiro256plus.o
	$(CC) $(CFLAGS) $(OFLAGS) -o $@ $^ $(LDFLAGS) $(GL_LDFLAGS)

clean:
	rm -f $(TARGETS) *.o *.s *.i *.bc

.PHONY: clean all
