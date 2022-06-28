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

vcftools --missing-indv  --vcf /home/hennelly/Chapter3/FinalDataset/vcffiles/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3.recode.vcf
