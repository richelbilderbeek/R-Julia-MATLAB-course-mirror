#!/bin/bash
#SBATCH -A hpc2ncourses2026-017 # Change to your own project ID
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml GCC/14.3.0 R/4.5.2 OpenMPI/5.0.8 R-bundle-CRAN/2025.11 

# Batch script to submit the R program parallel_foreach.R 
R -q --slave -f parallel_foreach.R

