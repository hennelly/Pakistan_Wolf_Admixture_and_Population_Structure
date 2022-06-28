#!/bin/bash -l
#SBATCH --job-name=pca_onlygraywolf
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/FinalDataset/slurmout/pca_onlygraywolf.out
#SBATCH -e /home/hennelly/Chapter3/FinalDataset/slurmout/pca_onlygraywolf.err

module load vcftools
vcftools --minQ 30 \
--vcf /home/hennelly/Chapter3/FinalDataset/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_noastricks_adjusted.recode.vcf \
--out /home/hennelly/Chapter3/FinalDataset/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing1_noastricks_adjusted \
--max-missing 1 \
--mac 3 \
--recode \
--recode-INFO-all
