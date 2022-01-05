#!/bin/bash
#SBATCH --job-name=Test_MLMA
#SBATCH --partition=batch
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=ys98038@uga.edu
#SBATCH --ntasks=1                 
#SBATCH --cpus-per-task=32
#SBATCH --mem=169gb
#SBATCH --time=6-00:00:00   
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err 

#Put down
#chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X XY)
chr=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22)

################## First step ##################
# --make-grm 
for i in ${chr[@]};do /home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --bfile /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/AFR/chr"$i" --make-grm   --maf 0.00001 --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/Michael_no_reml_bfile_AFR_Omega_3_chr"$i" --thread-num 32; done

# Tests
#for i in ${chr[@]};do /home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --bfile /scratch/ys98038/UKB/plink1.9_format/ukb_chr"$i" --make-grm --out Final_bfile_AFR_Omega_3_chr"$i" --thread-num 32; done

################## Second step ##################

################## @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ ################## 
################## @@@@@@@@@@@@@@@@@ Create your own files about multi_grm.txt, please see the example file multi_grm.txt @@@@@@@@@@@@@@@@@ ################## 
################## @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@ ################## 

# --make-grm	--mgrm
/home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --make-grm  --mgrm /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/multi_grm.txt --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/Michael_multi_AFR_Omega_3_chr1 --thread-num 32

# Tests
#/home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --make-grm	--mgrm /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_grm1.txt  --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_AFR_Omega_3_chr1 --thread-num 32
#/home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --make-grm  --mgrm /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_grm2.txt --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_AFR_Omega_3_chr1_loco --thread-num 32

################## Third step ##################

# --mlma 
for i in ${chr[@]};do /home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --mlma --bfile /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/AFR/chr"$i"  --grm /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/Michael_multi_AFR_Omega_3_chr1 --pheno /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/PUFA_GWAS_pheno_M2.AFR.txt.pc.txt.w3FA_NMR_resinv.phen --qcovar /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/PUFA_GWAS_pheno_M2.AFR.txt.pc.txt.qcovar --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/Michael/Michael_multi_AFR_Omega_3_chr"$i" --thread-num 32; done

# Tests
#for i in ${chr[@]};do /home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --mlma --bfile  /scratch/ys98038/UKB/plink1.9_format/AFR_ukb_chr"$i" --grm /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_AFR_Omega_3_chr1 --pheno /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/bd_pheno_AFR_12_20_Omega3.txt --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_AFR_Omega_3_chr"$i" --thread-num 32; done
#for i in ${chr[@]};do /home/ys98038/apps/GCTA/gcta_1.93.3beta2/gcta64 --mlma --bfile  /scratch/ys98038/UKB/plink1.9_format/AFR_ukb_chr"$i"  --grm /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_AFR_Omega_3_chr1_loco --pheno /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/bd_pheno_AFR_12_20_Omega3.txt --out /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/MLMA/multi_AFR_Omega_3_chr"$i"_loco --thread-num 32; done
