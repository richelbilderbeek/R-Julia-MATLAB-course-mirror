#!/bin/bash 
# A batch script for running the R program parallel_foreach.R
#SBATCH -A naiss2026-4-1022-cpu 
#SBATCH -t 00:10:00
#SBATCH -n 16
#SBATCH -p cpu

module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11 

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R

