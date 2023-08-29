setwd("C:/Users/jh/Desktop/EPFL/lab/GWAS/Gowinda/Gowinda-GO_enrich")

library(data.table) #fread is actually in data.table
library(tidyverse)
tsv= read_tsv("Entropy2_cand_SNPS.tsv")
newtsv= "Entropy2_subcand_SNPS.tsv"

tsvread= fread("Entropy2_cand_SNPS.tsv")
filtered= tsvread[FDR_BH<0.05]
fwrite(filtered,newtsv,sep= "\t", quote=FALSE)
nrow(filtered)
max(filtered$FDR_BH)
min(filtered$FDR_BH)

