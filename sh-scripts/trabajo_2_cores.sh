#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

OMP_NUM_THREADS=1 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=2 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=4 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=8 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=16 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=32 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2
OMP_NUM_THREADS=64 OMP_SCHEDULE=static ./restore2 -i grande.ppm -o grande_salida1.ppm -b 2




