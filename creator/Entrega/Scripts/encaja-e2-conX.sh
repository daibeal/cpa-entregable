#!/bin/sh
#PBS -l nodes=1,walltime=00:05:00
#PBS -q cpa
#PBS -d .
#PBS -o tiempos_e2_PX.txt
./encaja-e1


OMP_NUM_THREADS=1 ./encaja-e2-px
OMP_NUM_THREADS=2 ./encaja-e2-px
OMP_NUM_THREADS=4 ./encaja-e2-px
OMP_NUM_THREADS=8 ./encaja-e2-px
OMP_NUM_THREADS=16 ./encaja-e2-px
OMP_NUM_THREADS=32 ./encaja-e2-px

