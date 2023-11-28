#!/bin/bash

# Compila a bagaça
make all

# Arquivo CSV saida
echo "Iteracao,Tempo(ms)" > resultados.csv

for ((i=1; i<=100; i++))
do
    start_time=$(date +%s%3N)
    ./quicksort
    end_time=$(date +%s%3N)    

    elapsed_time=$((end_time - start_time))

    echo "$i,$elapsed_time" >> resultados.csv
done

make clean
