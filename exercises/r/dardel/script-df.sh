#!/bin/bash
#SBATCH -A naiss2026-4-1022 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH -p main
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

module load PDC/26.03 R/4.5.2-cpeGNU-26.03 

Rscript --no-save --no-restore script-df.R
