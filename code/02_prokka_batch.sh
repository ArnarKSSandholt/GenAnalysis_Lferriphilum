#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 1:00:00
#SBATCH -J Lferr_prokka_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user arnarkari.sigurearsonsandholt.9531@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka

# Your commands
prokka --prefix lferr --force --addgenes --genus Leptospirillum --species ferriphilum --strain DSM_14647 --gram neg --usegenus --proteins Leptospirillum --cpus 0 --rfam lferr_genome_final.fasta