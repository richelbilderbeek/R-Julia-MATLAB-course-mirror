#!/bin/bash
#SBATCH -A hpc2ncourses2026-017 # Change to your own project ID
#SBATCH --time=00:30:00 # Asking for 30 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.5.2 and prerequisites + R-bundle-CRAN/2025.11 and R-bundle-Bioconductor/3.22-R-4.5.2
module load GCC/14.3.0 R/4.5.2
module load OpenMPI/5.0.8 R-bundle-CRAN/2025.11 R-bundle-Bioconductor/3.22-R-4.5.2

Rscript --no-save --no-restore script-df.R

