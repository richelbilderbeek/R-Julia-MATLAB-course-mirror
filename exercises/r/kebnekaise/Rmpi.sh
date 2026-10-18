#!/bin/bash
#SBATCH -A hpc2ncourses2026-017 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 8

export OMPI_MCA_mpi_warn_on_fork=0

ml purge > /dev/null 2>&1
ml GCC/14.3.0 R/4.5.2
ml OpenMPI/5.0.8 R-bundle-CRAN/2025-11

mpirun -np 1 Rscript Rmpi.R 

