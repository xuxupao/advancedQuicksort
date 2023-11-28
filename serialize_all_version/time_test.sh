#!/bin/bash

rm resultados.csv
# Compila a bagaça
make all

# Arquivo CSV saida
echo "Iteracao,Tempo(ns)" > resultados.csv

for ((i=1; i<=10000; i++))
do
    start_time=$(date +%s%N)
    ./quicksort
    end_time=$(date +%s%N)    

    elapsed_time=$((end_time - start_time))

    echo "$i,$elapsed_time" >> resultados.csv
done

make clean
