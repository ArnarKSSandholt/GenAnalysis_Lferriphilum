#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 4:00:00
#SBATCH -J Lferr_fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user arnarkari.sigurearsonsandholt.9531@student.uu.se

# Load modules
module load bioinfo-tools
module load FastQC/0.11.8

# Your commands
fastqc -o fastqc_output -f fastq -t 4 data/RNA_noTrim/* data/RNA_Trim/*