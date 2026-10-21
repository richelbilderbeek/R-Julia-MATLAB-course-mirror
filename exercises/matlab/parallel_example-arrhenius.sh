#!/bin/bash
# Change to your actual project number
#SBATCH -A naiss2026-4-1022-cpu
# Remember, there are 4 workers and 1 master!
#SBATCH -p cpu
#SBATCH -n 16
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider MATLAB
ml MATLAB/2025b

# Executing a parallel matlab program
matlab -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
