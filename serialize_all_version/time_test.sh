#!/bin/bash

rm resultados_serial.csv
# Compila a bagaça
#make all

# Arquivo CSV saida
echo "Tamanho,Tempo,EXE,TOTAL_STALLS,SERIAL_STALLS,BAD_SPEC,FE_BOUND,BE_BOUND,BR_MIS" > resultados_serial.csv

for ((j=10; j<=100000; j=j*10))
do
    for ((i=0; i<1000; i++))
    do
        out=$(perf stat -e EXE_ACTIVITY.EXE_BOUND_0_PORTS,CYCLE_ACTIVITY.STALLS_TOTAL,RESOURCE_STALLS.SCOREBOARD ./quicksort $j 2>&1)
        elapsed_time=$(echo "$out" | grep "Sorting" | awk '{print $5}')
        exe=$(echo "$out" | grep "EXE_ACTIVITY.EXE_BOUND_0_PORTS" | awk '{print $1}')
        total_stalls=$(echo "$out" | grep "CYCLE_ACTIVITY.STALLS_TOTAL" | awk '{print $1}')
        serial_stalls=$(echo "$out" | grep "RESOURCE_STALLS.SCOREBOARD" | awk '{print $1}')
        
        out=$(perf stat ./quicksort $j 2>&1)
        bad_spec=$(echo "$out" | grep "cpu_core/topdown-bad-spec/" | awk '{print $4}')
        bad_spec=$(echo "$bad_spec" | sed 's/,/./; s/%//')
        fe_bound=$(echo "$out" | grep "cpu_core/topdown-fe-bound/" | awk '{print $4}')
        fe_bound=$(echo "$fe_bound" | sed 's/,/./; s/%//')
        be_bound=$(echo "$out" | grep "cpu_core/topdown-be-bound/" | awk '{print $4}')
        be_bound=$(echo "$be_bound" | sed 's/,/./; s/%//')
        br_mis=$(echo "$out" | grep "cpu_core/topdown-br-mispredict/" | awk '{print $4}')
        br_mis=$(echo "$br_mis" | sed 's/,/./; s/%//')

        echo "$j,$elapsed_time,$exe,$total_stalls,$serial_stalls,$bad_spec,$fe_bound,$be_bound,$br_mis" >> resultados_serial.csv
    done
done

#make clean
