#!/bin/bash -l
#SBATCH --job-name=noindels
#SBATCH --array=1-40
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 6-00:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/GenotypeGATK/noindels_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/GenotypeGATK/noindels_%A_%a.err

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)

module load R
module load maven
module load java

export PATH=$PATH:/home/hennelly/Chapter3/bin/gatk-4.2.6.0

gatk SelectVariants \
    -V gatk_${CHR}_filtered.vcf.gz \
    -select-type SNP \
    -O gatk_${CHR}_filtered_noindels.vcf.gz   
