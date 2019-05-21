# Script used to generate the talbe required to plot the results of the RNA expression analysis

import csv

rna_expression_data = "/home/arnar/Documents/GitHub/GenomeAnalysis/lferr_deseq2_results.csv"
input_list = ["/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/ATP_synthase.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/carb_fix_via_CBB.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/carb_fix_via_rTCA.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/c_di_GMP.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/chemotaxis.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/metal_resist.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/motility.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/NADH_dehydrogenase.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S5_oxidative_stress_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S3_low_ph_adaptation_annotated.csv",\
            "/home/arnar/Documents/GitHub/GenomeAnalysis/analyses/20190513_annotation_comp/S8_biofilm_formation_annotated.csv"]
output = "/home/arnar/Documents/GitHub/GenomeAnalysis/plot_table.csv"
description_list = ["ATP synthase", "Carbon fixation via CBB cycle", "Carbon fixation via rTCA cycle", "c−di−GMP", "Chemotaxis",\
                    "Metal resistance", "Motility", "NADH dehydrogenase", "Oxidative stress response", "pH homeostasis",\
                    "Polysaccharides", "Other"]

i = 0
counter = 1
with open(output, "w") as output:
    merger = csv.writer(output, delimiter=",")
    header = ["num", "Generalized functional category", "log2FC", "p-value"]
    merger.writerow(header)
    used_id = []
    for file_name in input_list:
        with open(rna_expression_data, "r") as expression_data:
            with open(file_name, "r") as file:
                table = list(csv.reader(file, delimiter="\t"))
                expression = list(csv.reader(expression_data, delimiter=","))
                for row in table:
                    if row[0].strip() == "Subsystem":
                        continue
                    if len(row) > 4:
                        new_line = []
                        new_line.append(counter)
                        counter += 1
                        new_line.append(description_list[i])
                        for line in expression:
                            if row[4].strip() == line[0].strip() and line[2].strip() != "NA":
                                used_id.append(row[4].strip())
                                new_line.append(line[2].strip())
                                if float(line[6]) < 0.05:
                                    new_line.append("p < 0.05")
                                else:
                                    new_line.append("p > 0.05")
                                merger.writerow(new_line)
                                break
                i += 1
    i += 1
    with open(rna_expression_data, "r") as expression_data:
        expression = csv.reader(expression_data, delimiter=",")
        next(expression, None)
        for line in expression:
            if line[0].strip() not in used_id and line[2].strip() != "NA":
                if float(line[6]) < 0.05:
                    merger.writerow([counter, description_list[11], line[2].strip(), "p < 0.05"])
                else:
                    merger.writerow([counter, description_list[11], line[2].strip(), "p > 0.05"])
                counter += 1
