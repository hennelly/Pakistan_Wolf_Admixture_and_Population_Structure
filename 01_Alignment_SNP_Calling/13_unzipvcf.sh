#!/bin/bash -l
#SBATCH --job-name=unzip
#SBATCH --array=1-40
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/unzip_filtered_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/unzip_filtered_%A_%a.err

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths_autosomes.txt | cut -f1)

gunzip /home/hennelly/Chapter3/Alignment/GenotypeGATK/gatk_${CHR}_filtered_noindels.vcf.gz
