#!/bin/bash

rm resultados.csv
# Compila a bagaça
#make all

# Arquivo CSV saida
echo "Tamanho,Tempo,PRF_DM,BR_MSP" > resultados.csv

for ((j=10; j<=100000; j=j*10))
do
    for ((i=0; i<1000; i++))
    do
        out=$(./quicksort $j)
        elapsed_time=$(echo "$out" | grep "Sorting" | awk '{print $5}')
        prf_dm=$(echo "$out" | awk 'NR==3{print $1}')
        br_msp=$(echo "$out" | awk 'NR==3{print $2}')

        echo "$j,$elapsed_time,$prf_dm,$br_msp" >> resultados.csv
    done
done

#make clean
