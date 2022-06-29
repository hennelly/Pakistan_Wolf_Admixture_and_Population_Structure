#!/bin/bash -l
#SBATCH --job-name=pruneLD
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/PCA/slurmout/pruneLD_onlygraywolfremove.out
#SBATCH -e /home/hennelly/Chapter3/PCA/slurmout/pruneLD_onlygraywolfremove.err

module load plink 

FILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3_noastrick_adjusted.recode.vcf
LD=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3_noastrick_adjusted_pruneLD0.5.prune.out
OUTFILE=/home/hennelly/Chapter3/PCA/PCAdataset/Autosomes_gatkfilter_noindels_minQ30_onlywolves_mac3_noastricks_adjusted_pruneLD0.5_geno0.1

plink --vcf ${FILE} \
--extract ${LD} \
--geno 0.1 \
--out ${OUTFILE} \
--allow-extra-chr \
--make-bed \
--recode \
--const-fid 0 \
--dog
