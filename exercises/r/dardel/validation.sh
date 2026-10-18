#!/bin/bash
#SBATCH -A naiss2026-4-1022 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need
module load PDC/26.03 R/4.5.2-cpeGNU-26.03

#install datarium before running this batch script 
#Start R
#install.packages('datarium', repos='http://ftp.acc.umu.se/mirror/CRAN/') 

# Run your R script (here 'validation.R'. Give the path if it is not located in the same directory)
R --no-save --quiet < validation.R
