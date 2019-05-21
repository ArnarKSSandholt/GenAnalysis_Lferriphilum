# Inspired by code written by Roberto Rossini
# This script merges the annotation information from the article with information from the new annotation
# with both Prokka and EggNOG.

import csv
from Bio import SeqIO
from Bio.Blast import NCBIXML

prokka_fasta = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/lferr/lferr.ffn"
eggNOG_ann = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/lferr_eggnog_annotation.csv"
blast_out = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/lferr_comp.xml"
output_name = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/fasta_merge.csv"


with open(eggNOG_ann, "r") as egg:
    eggNOG_annotation = list(csv.reader(egg, delimiter="\t"))
    prokka_annotation = SeqIO.parse(prokka_fasta, "fasta")
    with open(blast_out) as blast_out2:
        blast_comparison = NCBIXML.parse(blast_out2)
        with open(output_name, "w") as output:
            merger = csv.writer(output, delimiter="\t")
            header = ["Canu_id", "Prokka_annotation", "Article_id", "Article_annotation", "EggNOG_annotation",\
                    "EggNOG_gene_name", "GO_terms", "KEGG_KO", "BiGG_reactions", "COG_cat"]
            merger.writerow(header)
            i = 1
            for entry in blast_comparison:
                for record in prokka_annotation:
                    line = []
                    line.append(record.id)
                    if str(record.id) == entry.query[0:14]:
                        line.append(entry.query[15:])
                        if entry.descriptions != []:
                            ident = entry.descriptions[0].title.find(" ")
                            line.append(entry.descriptions[0].title[ident+1:ident+11])
                            line.append(entry.descriptions[0].title[ident+12:])
                    if i < len(eggNOG_annotation) and eggNOG_annotation[i][0] == record.id:
                        j = 4
                        while j < 13:
                            line.append(eggNOG_annotation[i][j])
                            if j == 7:
                                j += 4
                            else:
                                j += 1
                        i += 1
                    if len(line) == 10:
                        new_line = [None]*10
                        new_line[0:4] = line[0:4]
                        new_line[4] = line[9]
                        new_line[5:] = line[4:9]
                        line = new_line
                    merger.writerow(line)
                    if str(record.id) == entry.query[0:14]:
                        break
        

