#!/bin/bash
#SBATCH -A naiss2026-4-1022 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.5.2-cpeGNU-26.03 and prerequisites
module load PDC/26.03 R/4.5.2-cpeGNU-26.03

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R

