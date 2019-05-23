# R script for doing the RNA expression analysis
# Requires having made two files, count_table.csv with the counts for each gene in each condition and
# column_data.csv with information on each condition.  For plotting the results, you also need the plot_table file. 

library(DESeq2)
library(ggplot2)
library(scales)

coldata_loc = "/home/arnar/Documents/GitHub/GenomeAnalysis/column_data.csv"
table_loc = "/home/arnar/Documents/GitHub/GenomeAnalysis/count_table.csv"
plot_data_loc = "/home/arnar/Documents/GitHub/GenomeAnalysis/plot_table.csv"

cts = as.matrix(read.csv(table_loc,sep=",", row.names = "gene_id"))
coldata = read.csv(coldata_loc, row.names = 1)
coldata <- coldata[,c("condition","type")]

dds <- DESeqDataSetFromMatrix(countData = cts,
                               colData = coldata,
                               design = ~ condition)

dds <- DESeq(dds)
res <- results(dds, contrast = c("condition", "bioreactor", "Mineral_leaching"))

reslfc = lfcShrink(dds, coef = "condition_Mineral_leaching_vs_bioreactor", type = "apeglm")

resOrdered <- res[order(res$pvalue),]
summary(res)

plotMA(res)

plotMA(reslfc)

vsd = vst(dds)
plotPCA(vsd, intgroup=c("condition", "type"))

write.csv(as.data.frame(resOrdered), file="lferr_deseq2_results.csv")

plot_df = read.csv(plot_data_loc,sep=",", stringsAsFactors = T, row.names = "num")

ggplot(plot_df, aes(x = Generalized.functional.category, y = log2FC)) +
  geom_jitter(aes(color=p.value, shape=p.value, alpha = p.value), width = 0.2, height = 0, size = 2) +
  scale_x_discrete(limits=c("ATP synthase", "Carbon fixation via CBB cycle", "Carbon fixation via rTCA cycle", "c−di−GMP", "Chemotaxis",
                            "Metal resistance", "Motility", "NADH dehydrogenase", "Oxidative stress response", "pH homeostasis",
                            "Polysaccharides", "Other"), labels = wrap_format(18)) +
  scale_alpha_manual(values=c(1,0.5)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  geom_hline(yintercept=0) +
  ylim(-5,7.5) +
  xlab("Generalized functional categories")




