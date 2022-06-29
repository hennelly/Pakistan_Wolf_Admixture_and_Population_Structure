#!/bin/bash -l
#SBATCH --job-name=filtering_PCA
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/PCA/slurmout/filtering_allsamples.out
#SBATCH -e /home/hennelly/Chapter3/PCA/slurmout/filtering_allsamples.err

FILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3.recode.vcf
OUTFILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3_noastrick.recode.vcf
## Remove astricks
grep -v "*" ${FILE} > ${OUTFILE}

## fix the variant ID column
FINALFILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3_noastrick_adjusted.recode.vcf
awk 'BEGIN{OFS="\t"} !/#/ {sub(/\./, $1"_"$2, $3)}1' ${OUTFILE} > ${FINALFILE}
