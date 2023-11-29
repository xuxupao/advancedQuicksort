#!/bin/bash

rm *.csv
make clean
# Limpa e compila
make

# Roda o programa principal com um parametro para o tamanho do array. Além disso, coleta o tempo de execução.
run_and_capture_time() {
    param=$1
    output_file="${param}_output.csv"    

    for i in {1..1000}; do
        time=$(./quicksort $param | grep -oP 'Sorting \d+ elements took \K\d+')
        echo "$time" >> "$output_file"
    done
}

parameters=(10 100 1000 10000 100000)

for param in "${parameters[@]}"; do
    run_and_capture_time $param
done


