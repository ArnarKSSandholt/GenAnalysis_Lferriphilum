#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:00:00
#SBATCH -J job_name
#SBATCH --mail-type=ALL
#SBATCH --mail-user your_email

# Load modules
module load bioinfo-tools
module load ....

# Your commands
<Command_1...>
<Command_2...>
