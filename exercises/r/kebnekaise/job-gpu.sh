#!/bin/bash
#SBATCH -A hpc2ncourses2026-017 # Change to your own project ID
#Asking for 1 hour.
#SBATCH -t 03:00:00
#SBATCH -n 1
#SBATCH --gpus=1
#SBATCH -C l40s
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml GCC/14.3.0 R/4.5.2 CUDA/12.9.1
ml OpenMPI/5.0.8 R-bundle-CRAN/2025.11

R --no-save --no-restore -f gpu-script-db-higgs.R

