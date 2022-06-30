#!/bin/bash -l
#SBATCH --job-name=pca_onlygraywolf
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/PCA/slurmout/pca_onlyEurasiagraywolf_minDP4.out
#SBATCH -e /home/hennelly/Chapter3/PCA/slurmout/pca_onlyEurasiagraywolf_minDP4.err

module load plink

FILE=/home/hennelly/Chapter3/FinalDataset/PCAdataset/Autosomes_gatkfilter_noindels_minQ30_onlywolves_mac3_noastricks_adjusted_pruneLD0.5_geno0.1
OUTFILE=/home/hennelly/Chapter3/PCA/results/PCAresults_newsamples
plink --file ${FILE} \
--pca var-wts \
--const-fid 0 \
--dog \
--out ${OUTFILE}

Autosomes_onlyEurasiawolves_gatkfilter_noindels_minQ30_maxmissing1_mac3_minD4.recode.vcf

Autosomes_onlyEurasiawolves_gatkfilter_noindels_minQ30_maxmissing1_mac3_minD3.recode.vcf

#!/bin/bash -l
#SBATCH --job-name=missingness
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/missingness.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/missingness.err

module load vcftools

vcftools --missing-indv  --vcf /home/hennelly/Chapter3/FinalDataset/PCAdataset/Autosomes_onlyEurasiawolves_gatkfilter_noindels_minQ30_maxmissing1_mac3_minD3.recode.vcf


Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing1_mac3_minD3.recode.vcf
