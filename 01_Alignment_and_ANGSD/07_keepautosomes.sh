#!/bin/bash -l
#SBATCH --job-name=bam_subset
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --array 1-48
#SBATCH --time 1-2:00:00
#SBATCH --mem=1GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/bam_subset_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/bam_subset_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist.txt)
echo ${SAMPLE}
DIR=/home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset
DIROUT=/home/hennelly/Chapter3/angsdPCA/bams_autosomes
BEDIN=chr_keep.bed

module load bedtools

bedtools intersect -abam ${DIR}/${SAMPLE}.bam -b ${BEDIN} > ${DIROUT}/${SAMPLE}_autosomes.bam




