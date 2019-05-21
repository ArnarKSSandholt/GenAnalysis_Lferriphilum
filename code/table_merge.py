# This script takes information from supplementary tables S1-S8 from the article where
# the authors split the genes from L. ferriphilum into subsystems.  It merges this with
# the genes from the new annotation so that the subsystem categorization can be used
# for the RNA expression analysis.

import csv

anno_table = "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/fasta_merge.csv"
input_list = ["/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S1_energy_conservation.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S2_CO2_N_fixation.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S3_low_ph_adaptation.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S4_metal_resist.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S5_oxidative_stress.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S6_chemotaxis_motility.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S7_quorum_sensing.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/data/Article_tables/S8_biofilm_formation.csv"]
output_list = ["/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S1_energy_conservation_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S2_CO2_N_fixation_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S3_low_ph_adaptation_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S4_metal_resist_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S5_oxidative_stress_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S6_chemotaxis_motility_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S7_quorum_sensing_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S8_biofilm_formation_annotated.csv"]

i = 0
for file_name in input_list:
    with open(anno_table, "r") as annotations_table:
        with open(file_name, "r") as file:
            table = csv.reader(file, delimiter="\t")
            annotations = list(csv.reader(annotations_table, delimiter="\t"))
            with open(output_list[i], "w") as output:
                merger = csv.writer(output, delimiter="\t")
                header = ["Subsystem", "Locus_tag", "Gene", "Predicted_function", "Canu_id",\
                        "Prokka_annotation", "Article_id", "Article_annotation", "EggNOG_annotation",\
                        "EggNOG_gene_name", "GO_terms", "KEGG_KO", "BiGG_reactions", "COG_cat"]
                merger.writerow(header)
                i += 1
                for row in table:
                    new_line = []
                    for el in row:
                        new_line.append(el)
                    if new_line[0].strip() == "Subsystem":
                        continue
                    for line in annotations:
                        if len(line) > 2:
                            if row[1].strip() == line[2].strip():
                                for elem in line:
                                    new_line.append(elem)
                                break
                    merger.writerow(new_line)