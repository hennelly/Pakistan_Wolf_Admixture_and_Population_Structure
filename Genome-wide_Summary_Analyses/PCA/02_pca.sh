#!/bin/bash -l
#SBATCH --job-name=pca_onlygraywolf
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/PCA/slurmout/pca_onlygraywolf.out
#SBATCH -e /home/hennelly/Chapter3/PCA/slurmout/pca_onlygraywolf.err

module load plink

FILE=/home/hennelly/Chapter3/FinalDataset/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_noastricks_adjusted.recode.vcf
OUTFILE=/home/hennelly/Chapter3/PCA/results/PCAresults_onlygraywolf
plink --vcf ${FILE} \
--pca var-wts \
--const-fid 0 \
--dog \
--out ${OUTFILE}
