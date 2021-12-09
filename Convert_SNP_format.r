library(dplyr)

# Change the pathway @@@
Pathway_geno="/scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/"
Pathway_out="/scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/"

# 2016, Nature Communications 27005778 Johannes Kettunen serum/plasma NMR; total omega 3; total omega 6; DHA; LA; Other PUFAs than 18:2;
PUFA_LIST=c("FAw3","FAw6","MUFA","DHA","LA")

for (n in PUFA_LIST) {
  Trait1_final_infile=paste(Pathway_geno,"Summary_statistics_MAGNETIC_",n,".txt", sep="")
  # Read the table and realize " " as separate
  Trait1_final <- read.table(Trait1_final_infile,header=T, as.is=T,sep = " ")
  
  # Change the ninth column name to "p_value"
  colnames(Trait1_final)[9] <- c("p_value")
  
  # Save the file and realize "\t" as separate
  Outputfile=paste(Pathway_out,"MAGNETIC_",n, ".txt", sep="")
  write.table(Trait1_final, file= Outputfile, col.names = T, append = TRUE, row.names = FALSE, quote = FALSE, sep='\t')
}

# 2019, Nature 31367044 Adam E Locke serum NMR; DHA; total omega 3; total omega 6; LA; total PUFA;
PUFA_LIST=c("PUFA","FAw3","FAw6","MUFA","DHA","LA")

for (n in PUFA_LIST) {
  Trait1_final_infile=paste(Pathway_geno,"LockeAE_prePMID_",n,"_sex-combined", sep="")
  # Read the table
  Trait1_final <- read.table(Trait1_final_infile,header=T, as.is=T,sep = "\t")
  
  # Check the proportion of samples in analysis with a called genotype at the variant
  print(summary(Trait1_final$CALLRATE))
  
  # Separate MARKER_ID: Variant ID, typically in CHR:POS_REF/ALT_ID format where "ID" adds rsID if known, or repeats CHR:POS_REF/ALT no known rsID
  # Create new variable "SNP" for SNPs
  Trait1_final$SNP=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",3)
  Trait1_final$SNP1=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",4)
  Trait1_final$SNP=ifelse(is.na(Trait1_final$SNP1)==F,paste(Trait1_final$SNP,Trait1_final$SNP1,sep = ":"),Trait1_final$SNP)
  Trait1_final$SNP2=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",5)
  Trait1_final$SNP=ifelse(is.na(Trait1_final$SNP2)==F,paste(Trait1_final$SNP,Trait1_final$SNP2,sep = ":"),Trait1_final$SNP)
  Trait1_final$SNP3=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",6)
  Trait1_final$SNP=ifelse(is.na(Trait1_final$SNP3)==F,paste(Trait1_final$SNP,Trait1_final$SNP3,sep = "/"),Trait1_final$SNP)
  
  # Change chromosome X to chromosome 23
  Trait1_final$CHROM[Trait1_final$CHROM == "X"] <- 23
  # Check each chromosome
  print(table(Trait1_final$CHROM))
  # Convert to numeric variable
  Trait1_final$CHROM=as.numeric(Trait1_final$CHROM)
  
  # Create new variable "ALLELE" for allele
  Trait1_final$ALLELE=sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",2)
  # Separate allele to NonRefAllele and RefAllele
  Trait1_final$NonRefAllele=sapply(strsplit(Trait1_final$ALLELE, split= "/", fixed=TRUE),"[",2)
  Trait1_final$RefAllele=sapply(strsplit(Trait1_final$ALLELE, split= "/", fixed=TRUE),"[",1)
  
  # Chack whether there are other values for MARKER_ID
  print(table(sapply(strsplit(Trait1_final$MARKER_ID, split= "_", fixed=TRUE),"[",7)))
  
  # Chack the difference between starting and ending position
  print(summary(Trait1_final$END-Trait1_final$BEG))
  
  # Chack variables
  print(str(Trait1_final))
  
  # Chack the most significant p-value
  print(min(Trait1_final$PVALUE))
  
  # Save the file and realize "\t" as separate
  Outputfile=paste(Pathway_out,"Locke_",n, ".txt", sep="")
  write.table(Trait1_final, file= Outputfile, col.names = T, append = TRUE, row.names = FALSE, quote = FALSE, sep='\t')
}
