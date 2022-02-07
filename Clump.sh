ml PLINK/1.9b_5-x86_64
refdir=/scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics

plink \
--bfile $refdir/all_phase3_EUR_final \
--clump $refdir/META_IVW_FAw3.STDERR-N1.txt \
--clump-range  $refdir/glist-hg19 \
-out $refdir/FAw3_N1_r2_01 \
--allow-extra-chr  \
--clump-p1 5e-8 \
--clump-p2 5e-8 \
 --clump-r2 0.1\
 --clump-kb 250 \
--clump-field P-value \
--clump-snp-field MarkerName

