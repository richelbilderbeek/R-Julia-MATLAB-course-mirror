#!/bin/bash
#SBATCH -A naiss2026-4-1022-cpu # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core
#SBATCH -p cpu

# Load any modules you need
module load buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2 MPICH/4.3.2 R-bundle-CRAN/2025.11 

#install datarium before running this batch script, if it is not there
# or check bioconductor R module 
#Start R
#install.packages('datarium', repos='http://ftp.acc.umu.se/mirror/CRAN/') 

# Run your R script (here 'validation.R'. Give the path if it is not located in the same directory)
R --no-save --quiet < validation.R
