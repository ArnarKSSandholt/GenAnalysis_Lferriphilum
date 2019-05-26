#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J Lferr_synteny
#SBATCH --mail-type=ALL
#SBATCH --mail-user arnarkari.sigurearsonsandholt.9531@student.uu.se

# Load modules
module load bioinfo-tools
module load satsuma2

# Your commands
SatsumaSynteny2 -q analyses/20190411_prokka_annotation/lferr/lferr.fna -t lferrooxidans_whole_genome.fasta -o /home/akss94/GenomeAnalysis/GenomeAnalysis/satsuma_out



