library(dplyr)

Pathway_geno="/scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/"
Pathway_out="/scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/"

PUFA_LIST=c("FAw3","FAw6","MUFA","DHA","LA")

for (n in PUFA_LIST) {
  Trait1_final_infile=paste(Pathway_geno,"Summary_statistics_MAGNETIC_",n,".txt", sep="")
  
  Trait1_final <- read.table(Trait1_final_infile,header=T, as.is=T,sep = " ")
  colnames(Trait1_final)[9] <- c("p_value")
  
  Outputfile=paste(Pathway_out,"MAGNETIC_",n, ".txt", sep="")
  write.table(Trait1_final, file= Outputfile, col.names = T, append = TRUE, row.names = FALSE, quote = FALSE, sep='\t')
}

PUFA_LIST=c("PUFA","FAw3","FAw6","MUFA","DHA","LA")

for (n in PUFA_LIST) {
  Trait1_final_infile=paste(Pathway_geno,"LockeAE_prePMID_",n,"_sex-combined", sep="")
  
  Trait1_final <- read.table(Trait1_final_infile,header=T, as.is=T,sep = "\t")
  print(summary(Trait1_final$CALLRATE))
  
  Trait1_final$SNP=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",3)
  Trait1_final$SNP1=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",4)
  Trait1_final$SNP=ifelse(is.na(Trait1_final$SNP1)==F,paste(Trait1_final$SNP,Trait1_final$SNP1,sep = ":"),Trait1_final$SNP)
  Trait1_final$SNP2=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",5)
  Trait1_final$SNP=ifelse(is.na(Trait1_final$SNP2)==F,paste(Trait1_final$SNP,Trait1_final$SNP2,sep = ":"),Trait1_final$SNP)
  Trait1_final$SNP3=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",6)
  Trait1_final$SNP=ifelse(is.na(Trait1_final$SNP3)==F,paste(Trait1_final$SNP,Trait1_final$SNP3,sep = "/"),Trait1_final$SNP)
  
  Trait1_final$CHROM[Trait1_final$CHROM == "X"] <- 23
  print(table(Trait1_final$CHROM))
  Trait1_final$CHROM=as.numeric(Trait1_final$CHROM)
  
  Trait1_final$ALLELE=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",2)
  Trait1_final$NonRefAllele=sapply(strsplit(Trait1_final$ALLELE, split= "/", fixed=TRUE),"[",2)
  Trait1_final$RefAllele=sapply(strsplit(Trait1_final$ALLELE, split= "/", fixed=TRUE),"[",1)
  
  print(table(sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",7)))
  
  print(summary(Trait1_final$END-Trait1_final$BEG))
  
  print(str(Trait1_final))
  
  print(min(Trait1_final$PVALUE))
  
  Outputfile=paste(Pathway_out,"Locke_",n, ".txt", sep="")
  write.table(Trait1_final, file= Outputfile, col.names = T, append = TRUE, row.names = FALSE, quote = FALSE, sep='\t')
}
