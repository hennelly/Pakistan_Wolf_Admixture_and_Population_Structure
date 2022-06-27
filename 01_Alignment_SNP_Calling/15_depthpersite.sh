#!/usr/bin/env bash
#SBATCH --job-name=depthpersite
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 06:00:00
#SBATCH --mem=16GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/depthpersite.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/depthpersite.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93,c11-86

module load vcftools

vcftools --vcf /home/hennelly/Chapter3/Alignment/GenotypeGATK/Autosomes_gatkfilter_noindels.vcf --out All_Combined_depth --site-depth
