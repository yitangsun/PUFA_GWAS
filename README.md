# PUFA_GWAS

## Download files 

### 2016, Nature Communications      27005778        Johannes Kettunen     serum/plasma NMR; total omega 3; total omega 6; DHA; LA; Other PUFAs than 18:2;  https://www.ebi.ac.uk/gwas/studies/GCST003664
1. total omega 3 OmegaL3,fatty,acids\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_FAw3.txt.gz
2. total omega 6 OmegaL6,fatty,acids\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_FAw6.txt.gz
3. MUFA MonoLunsaturated,fatty,acids\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_MUFA.txt.gz
4. DHA 22:6,,docosahexaenoic,acid,(DHA)\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_DHA.txt.gz
5. LA 18:2,,linoleic,acid,(LA)\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST003001-GCST004000/GCST003664/Summary_statistics_MAGNETIC_LA.txt.gz
 
### 2019, Nature          31367044        Adam E Locke  serum NMR; DHA; total omega 3; total omega 6; LA; total PUFA; (mmol/L)  https://www.ebi.ac.uk/gwas/studies/GCST008673
1. total PUFA\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_PUFA_sex-combined.gz
2. total omega 3\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_FAw3_sex-combined.gz
3. total omega 6\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_FAw6_sex-combined.gz
4. Total Mono-unsatruated Fatty Acids (mmol/l)\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_MUFA_sex-combined.gz
5. DHA\
wget http://ftp.ebi.ac.uk/pub/databases/gwas/summary_statistics/GCST008001-GCST009000/GCST008673/LockeAE_prePMID_DHA_sex-combined.gz
6. LA\
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

## Apply omega-3 GWAS using mixed linear model association (MLMA) in the AFR population 
Please change the file names in MLMA.sh and multi_grm.txt. And run MLMA.sh

1. Estimate the GRMs from the SNPs on each chromosome.
2. Merge them by the commands --mgrm and --make-grm.
3. Use the genome-wide GRMs to apply MLMA on each chromosome.

Please note that you have to change the pathway.

