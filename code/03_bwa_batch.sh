#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 11:00:00
#SBATCH -J Lferr_RNA_mapping_counting
#SBATCH --mail-type=ALL
#SBATCH --mail-user arnarkari.sigurearsonsandholt.9531@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools
module load htseq

# Your commands
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2036629_P1.trim.fastq.gz data/RNA_Trim/ERR2036629_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2036629.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2036630_P1.trim.fastq.gz data/RNA_Trim/ERR2036630_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2036630.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2036631_P1.trim.fastq.gz data/RNA_Trim/ERR2036631_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2036631.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2036632_P1.trim.fastq.gz data/RNA_Trim/ERR2036632_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2036632.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2036633_P1.trim.fastq.gz data/RNA_Trim/ERR2036633_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2036633.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2117288_P1.trim.fastq.gz data/RNA_Trim/ERR2117288_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2117288.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2117289_P1.trim.fastq.gz data/RNA_Trim/ERR2117289_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2117289.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2117290_P1.trim.fastq.gz data/RNA_Trim/ERR2117290_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2117290.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2117291_P1.trim.fastq.gz data/RNA_Trim/ERR2117291_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2117291.txt
bwa mem -t 8 genome_ref_db.fasta data/RNA_Trim/ERR2117292_P1.trim.fastq.gz data/RNA_Trim/ERR2117292_P2.trim.fastq.gz  | samtools sort | htseq-count -t CDS -i ID -f bam -s no -r pos - lferr_no_genome.gff > output_2117292.txt

