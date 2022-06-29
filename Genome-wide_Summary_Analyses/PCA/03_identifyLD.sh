#!/bin/bash -l
#SBATCH --job-name=pruneLD
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/PCA/slurmout/pruneLD_onlygraywolf.out
#SBATCH -e /home/hennelly/Chapter3/PCA/slurmout/pruneLD_onlygraywolf.err

module load plink 

FILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3_noastrick_adjusted.recode.vcf
OUTFILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3_noastrick_adjusted_pruneLD0.5

plink --vcf ${FILE} \
--const-fid 0 \
--dog \
--allow-extra-chr \
--indep-pairwise 50 10 0.5 \
--geno 0.1 \
--out ${OUTFILE}
