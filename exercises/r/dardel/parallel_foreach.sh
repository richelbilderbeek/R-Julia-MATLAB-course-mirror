#!/bin/bash -l
# A batch script for running the R program parallel_foreach.R
#SBATCH -A naiss2026-4-1022 
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4
#SBATCH -p main

module load PDC/26.03 R/4.5.2-cpeGNU-26.03 

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R

