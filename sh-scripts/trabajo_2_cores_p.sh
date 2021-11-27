#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

OMP_NUM_THREADS=64 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=128 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2




