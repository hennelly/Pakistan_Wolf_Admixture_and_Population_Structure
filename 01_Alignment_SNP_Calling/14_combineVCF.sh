#!/usr/bin/env bash
#SBATCH --job-name=Combine_VCF
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 06:00:00
#SBATCH --mem=16GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/Combinevcf.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/Combinevcf.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93,c11-86

#for autosomes
cat <(grep "#" gatk_chr1_filtered_noindels.vcf) <(for number in $(seq 1 1 38); do grep -v "#" gatk_chr${number}_filtered_noindels.vcf; done) > Autosomes_gatkfilter_noindels.vcf

#for whole genome 
cat <(grep "#" gatk_chr1_filtered_noindels.vcf) <(for number in $(seq 1 1 39); do grep -v "#" gatk_chr${number}_filtered_noindels.vcf; done) <(grep -v "#" chrX/chrX_minQ30_noindels.recode.vcf) > Wholegenome_gatkfilter_noindels.vcf
