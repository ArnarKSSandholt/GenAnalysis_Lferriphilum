set terminal canvas jsdir ""
set output "/domus/h1/akss94/GenomeAnalysis/GenomeAnalysis/analyses/20190405_Canu_results/quast_results/results_2019_04_05_09_53_04/contigs_reports/nucmer_output/lferriphilum_1contig.html"
set xtics rotate ( \
 "0" 0, \
 "300000" 300000, \
 "600000" 600000, \
 "900000" 900000, \
 "1200000" 1200000, \
 "1500000" 1500000, \
 "1800000" 1800000, \
 "2100000" 2100000, \
 "2400000" 2400000, \
 "" 2610531 \
)
set size 1,1
set grid
set key outside bottom right
set border 5
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "tig00000001_len_2577733_reads_5229_covStat_4991.44_gappedBases_no_class_contig_suggestRepeat_no_suggestCircular_no" noenhanced
set format "%.0f"
set xrange [1:2610531]
set yrange [1:2577733]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/domus/h1/akss94/GenomeAnalysis/GenomeAnalysis/analyses/20190405_Canu_results/quast_results/results_2019_04_05_09_53_04/contigs_reports/nucmer_output/lferriphilum_1contig.fplot" title "FWD" w lp ls 1, \
 "/domus/h1/akss94/GenomeAnalysis/GenomeAnalysis/analyses/20190405_Canu_results/quast_results/results_2019_04_05_09_53_04/contigs_reports/nucmer_output/lferriphilum_1contig.rplot" title "REV" w lp ls 2
