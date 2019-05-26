import csv, re

eggNOG_ann = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/annotation/lferr_eggnog_annotation.csv"
output_name = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/annotation/kegg_num.tsv"

with open(eggNOG_ann, "r") as egg:
    eggNOG_annotation = csv.reader(egg, delimiter="\t")
    with open(output_name, "w") as output:
        kegg_writer = csv.writer(output, delimiter="\t")
        next(eggNOG_annotation, None)
        for line in eggNOG_annotation:
            if line[8]:
                k_num = re.findall('K[0-9][0-9][0-9][0-9][0-9]',str(line[8]))
                for num in k_num:
                    kegg_writer.writerow([line[0].strip(),num])
                
        
