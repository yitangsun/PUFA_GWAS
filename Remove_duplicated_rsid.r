'%ni%' <- Negate('%in%')
library(plyr)
library(dplyr)
library(tidyverse)
library(readr)

# Set the input directory. (@@@ Need to change.)
Pathway_SNP="/scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/"

#######     CHARGE_N3_  n, "_paper.txt", sep="")

PLASMA_2015_Dorajoo_GWAS_id=c("FAw3")

for (n in PLASMA_2015_Dorajoo_GWAS_id) {
  Inputfile=paste(Pathway_SNP, "META_IVW_", n, ".STDERR-N1.txt", sep="")
  exp_dat <- read.csv(Inputfile,header=T, as.is=T,sep = "\t")
 
  names(exp_dat)[names(exp_dat) == "MarkerName"] <- "variant_id"
  names(exp_dat)[names(exp_dat) == "Allele1"] <- "ALT"
  names(exp_dat)[names(exp_dat) == "Allele2"] <- "REF"
  exp_dat$ALT <- toupper(exp_dat$ALT)
  exp_dat$REF <- toupper(exp_dat$REF)
  
  exp_dat_dup= exp_dat[duplicated(exp_dat$variant_id),]$variant_id
  
  print(length(exp_dat_dup))
  
  exp_dat2 <-exp_dat[exp_dat$variant_id %ni% exp_dat_dup,]
  
  Outputfile1=paste(Pathway_SNP, "META_IVW_", n, "_STDERR-N1_rsID_remove_dup_rsid.txt", sep="")
  write.table(exp_dat2, file= Outputfile1, row.names = FALSE,col.names = T, quote = FALSE, sep='\t')
  
  exp_dat3<-exp_dat2%>%select(variant_id,P.value,TotalSampleSize)
  
  Outputfile1=paste(Pathway_SNP, "META_IVW_", n, "_STDERR-N1_rsID_remove_dup_rsid_p.txt", sep="")
  write.table(exp_dat3, file= Outputfile1, row.names = FALSE,col.names = T, quote = FALSE, sep='\t')

}

