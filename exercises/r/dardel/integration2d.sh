#!/bin/bash
#SBATCH -A naiss2026-4-1022  # your project_ID
#SBATCH -J job               # name of the job
#SBATCH  -p shared           # name of the queue
#SBATCH --ntasks=*FIXME*     # nr. of tasks
#SBATCH --cpus-per-task=1    # nr. of cores per-task
#SBATCH --time=00:03:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file


# Load dependencies and R version
ml PDC/26.03 R/4.5.2-cpeGNU-26.03

Rscript --no-save --no-restore integration2d.R

