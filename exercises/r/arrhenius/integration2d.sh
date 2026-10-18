#!/bin/bash
#SBATCH -A naiss2026-4-1022-cpu # your project id 
#SBATCH -J job               # name of the job
#SBATCH  -p cpu           # name of the partition
#SBATCH --ntasks=*FIXME*     # nr. of tasks
#SBATCH --cpus-per-task=1    # nr. of cores per-task
#SBATCH --time=00:03:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file


# Load dependencies and R version
ml buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11 

Rscript --no-save --no-restore integration2d.R

