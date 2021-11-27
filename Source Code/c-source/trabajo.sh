#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=5:00
#SBATCH --partition=cpa

OMP_NUM_THREADS=4 ./restore2ka -i peque.ppm -o imagen_salida5.ppm -b 8



