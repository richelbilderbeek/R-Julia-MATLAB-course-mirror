#!/bin/bash
# Set account. Remember what partition, for instance cpu
#SBATCH -A naiss2026-4-1022-cpu
# Set the time. Here 10 min
#SBATCH -t 00:10:00
# ask for some number of cores, here 8 cores
#SBATCH -n 8

# Load some modules you need
module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11

mpprun Rscript pbdMPI.R
