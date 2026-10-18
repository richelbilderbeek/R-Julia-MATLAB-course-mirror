#!/bin/bash
#SBATCH -A hpc2ncourses2026-017     # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n *FIXME*           # nr. tasks
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

ml purge > /dev/null 2>&1
ml GCC/14.3.0 R/4.5.2
Rscript --no-save --no-restore integration2d.R
