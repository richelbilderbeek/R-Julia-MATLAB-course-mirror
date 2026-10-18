#!/bin/bash
#SBATCH -A naiss2026-4-1022-cpu # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH -p cpu
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11 

srun Rscript MyRscript.R

