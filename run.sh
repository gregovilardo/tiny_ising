#!/bin/bash

COMPILERS=("gcc" "clang")

make clean

for compiler in "${COMPILERS[@]}"; do
    if ! command -v "$compiler" &> /dev/null; then
        echo "Warning: $compiler not found, skipping..."
        continue
    fi

    echo "===== Testing with $compiler ====="

    for n in {6..11}; do
        L=$((2**n))

        for x in {0..3}; do
            CC="$compiler" CFLAGS="-DL=$L -O$x" make --always-make tiny_ising

            outfile="pruebas/${compiler}_L${L}_O${x}.out"

            {
                echo "===== Results for $compiler, L=$L, -O$x ====="
                echo "===== Program output ====="
                perf stat -o perf.tmp ./tiny_ising 2>&1
                echo ""
                echo "===== Performance statistics ====="
                cat perf.tmp
            } > "$outfile"

            rm -f perf.tmp
            echo "Generated $outfile"
        done
    done
done

echo "All tests completed."
