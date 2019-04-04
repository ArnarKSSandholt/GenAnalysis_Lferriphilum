#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 13:00:00
#SBATCH -J L_ferr_Canu_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user arnarkari.sigurearsonsandholt.9531@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# Your commands
canu \
 -p lferriphilum -d lferriphilum-mix \
 genomeSize=2.6m \
 -pacbio-raw GenomeAnalysis/GenomeAnalysis/data/DNA_data/ERR2028*.fastq.gz \
 stopOnReadQuality=false \
 maxThreads=4
