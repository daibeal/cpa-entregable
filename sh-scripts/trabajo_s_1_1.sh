#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

OMP_NUM_THREADS=16 OMP_SCHEDULE=static,1 ./restore1 -i grande.ppm -o grande_salida1.ppm -b 2



