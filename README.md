# PUFA_GWAS

## Download files 

# 2016, Nature Communications      27005778        Johannes Kettunen     serum/plasma NMR; total omega 3; total omega 6; DHA; LA; Other PUFAs than 18:2;  https://www.ebi.ac.uk/gwas/studies/GCST003664
total omega 3 OmegaL3,fatty,acids
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_FAw3.txt.gz
total omega 6 OmegaL6,fatty,acids
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_FAw6.txt.gz
MUFA MonoLunsaturated,fatty,acids
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_MUFA.txt.gz
DHA 22:6,,docosahexaenoic,acid,(DHA)
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_DHA.txt.gz
LA 18:2,,linoleic,acid,(LA)
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_LA.txt.gz
 
# 2019, Nature          31367044        Adam E Locke  serum NMR; DHA; total omega 3; total omega 6; LA; total PUFA; (mmol/L)  https://www.ebi.ac.uk/gwas/studies/GCST008673
total PUFA
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_PUFA_sex-combined.gz
total omega 3
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_FAw3_sex-combined.gz
total omega 6
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_FAw6_sex-combined.gz
Total Mono-unsatruated Fatty Acids (mmol/l)
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_MUFA_sex-combined.gz
DHA
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_DHA_sex-combined.gz
LA
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_LA_sex-combined.gz

## Use R to prepare files for further analysis
Convert_SNP_format.r

## Use METAL for meta-analysis
1. Prepare files
METAL_FAw3.txt
METAL_FAw6.txt
METAL_MUFA.txt
METAL_DHA.txt
METAL_LA.txt
2. Run scrpit
METAL1.sh
You only need to change the pathway.

## Use Plink to identify lead SNPs
Plink_lead_SNPs.sh
