#!/bin/bash -l 
#SBATCH -A naiss2026-4-1022 
# Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH --nodes 2
#SBATCH --ntasks-per-node=8
#SBATCH -p main
#SBATCH --output=pbdMPI-test_%J.out 

ml PDC/26.03
ml R/4.5.2-cpeGNU-26.03

srun -n 4 Rscript pbdMPI.R
