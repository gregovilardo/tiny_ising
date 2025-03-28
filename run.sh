#!/bin/bash

COMPILERS=("gcc" "clang")

make clean

mkdir pruebas
updates="pruebas/updates.csv"
echo "L,compiler,optimization,updates/ns" >$updates

for n in {6..11}; do
    L=$((2 ** n))

    for compiler in "${COMPILERS[@]}"; do
        if ! command -v "$compiler" &>/dev/null; then
            echo "Warning: $compiler not found, skipping..."
            continue
        fi

        echo "===== Testing with $compiler ====="
        mkdir "pruebas/L${L}"

        for x in {0..3}; do
            CC="$compiler" CFLAGS="-DL=$L -O$x" make --always-make tiny_ising
            # outfile="pruebas/L${L}/${compiler}_O${x}.out"
            perfout="pruebas/L${L}/perfstats${compiler}_O${x}.out"
            perf stat --detailed -r 10 ./tiny_ising 2>$perfout
            cell_ns=$(awk '{s+=$1} {n+=1} END {print s/n}' out)
            echo "$L,$compiler,$x,$cell_ns" >>$updates
            rm out

            rm -f perf.tmp
            echo "Generated $outfile"
        done
    done
done

echo "All tests completed."
