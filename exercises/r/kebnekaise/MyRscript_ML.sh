#!/bin/bash
#SBATCH -A hpc2ncourses2026-017 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH --cpus-per-task=8
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load GCC/14.3.0 R/4.5.2 
module load OpenMPI/5.0.8 R-bundle-CRAN/2025.11
module load R-bundle-Bioconductor/3.22-R-4.5.2

srun Rscript MyRscript.R

