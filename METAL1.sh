#!/bin/bash
#SBATCH --job-name=METAL
#SBATCH --partition=ye_p
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=ys98038@uga.edu
#SBATCH --ntasks=1                    
#SBATCH --cpus-per-task=1
#SBATCH --mem=80gb
#SBATCH --time=6-00:00:00   
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err 

cd $SLURM_SUBMIT_DIR

ml Metal/20110325-foss-2019b

metal /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/METAL_FAw3.txt

metal /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/METAL_FAw6.txt

metal /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/METAL_MUFA.txt

metal /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/METAL_DHA.txt

metal /scratch/ys98038/UKB/plink2_format/PUFA_GWAS/Summary_statistics/METAL_LA.txt

