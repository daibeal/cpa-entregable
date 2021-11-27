#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

OMP_NUM_THREADS=1 ./restore0 -i grande.ppm -o grande_salida0.ppm -b 2

OMP_NUM_THREADS=2 ./restore0 -i grande.ppm -o grande_salida0.ppm -b 2

OMP_NUM_THREADS=4 ./restore0 -i grande.ppm -o grande_salida0.ppm -b 2

OMP_NUM_THREADS=8 ./restore0 -i grande.ppm -o grande_salida0.ppm -b 2

OMP_NUM_THREADS=16 ./restore0 -i grande.ppm -o grande_salida0.ppm -b 2

OMP_NUM_THREADS=32 ./restore0 -i grande.ppm -o grande_salida0.ppm -b 2



