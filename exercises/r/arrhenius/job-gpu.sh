#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A naiss2026-4-1022-gpu
#SBATCH -t 03:00:00
#SBATCH -p gpu
#SBATCH --gpus=1

ml purge > /dev/null 2>&1
module load  GPU/buildtool-easybuild/5.2.1-hpca3ef7d197 GCC/14.3.0 R/4.5.2-CUDA-12.9.1 MPICH/4.3.2 R-bundle-CRAN/2025.11

R --no-save --no-restore -f gpu-script-db-higgs.R

