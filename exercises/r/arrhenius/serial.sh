#!/bin/bash 
#SBATCH -A naiss2026-4-1022-cpu
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core
#SBATCH -p cpu

# Load any modules you need, here R/4.5.2
module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2

# Run your R script (here 'hello.R')
R --no-save --quiet < hello.R
