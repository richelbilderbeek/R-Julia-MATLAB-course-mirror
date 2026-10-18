#!/bin/bash
#SBATCH -A naiss2026-4-1022
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core
#SBATCH -p main

# Load any modules you need, here for R/4.5.2
module load PDC/26.03 R/4.5.2-cpeGNU-26.03

# Run your R script
Rscript add2.R 2 3
