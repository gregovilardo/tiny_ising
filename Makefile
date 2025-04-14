CC += 
CFLAGS += -g -std=gnu11 -Wall -Wextra
LDFLAGS=-lm
GL_LDFLAGS=-lGL -lglfw

# Files
TARGETS=tiny_ising demo

# Rules
all: $(TARGETS)

tiny_ising: tiny_ising.o ising.o xoshiro256plus.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

demo: demo.o ising.o wtime.o  xoshiro256plus.o
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(GL_LDFLAGS)

clean:
	rm -f $(TARGETS) *.o *.s *.i *.bc

.PHONY: clean all

