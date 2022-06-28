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

FILE=/home/hennelly/Chapter3/FinalDataset/PCAdataset/Autosomes_gatkfilter_noindels_minQ30_onlywolves_mac3_noastricks_adjusted_pruneLD0.5_geno0.1
OUTFILE=/home/hennelly/Chapter3/PCA/results/PCAresults_onlygraywolf_pruneLD
plink --file ${FILE} \
--pca var-wts \
--const-fid 0 \
--dog \
--out ${OUTFILE}
