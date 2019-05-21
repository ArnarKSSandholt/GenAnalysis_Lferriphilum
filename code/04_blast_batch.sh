#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J Lferr_to_Lferr_blast
#SBATCH --mail-type=ALL
#SBATCH --mail-user arnarkari.sigurearsonsandholt.9531@student.uu.se

# Load modules
module load bioinfo-tools
module load blast

# Your commands
blastp -db lferriphilum_db -query lferr/lferr.faa -out lferr_comp.txt -evalue 1e-9 -max_target_seqs 5 -outfmt 5
