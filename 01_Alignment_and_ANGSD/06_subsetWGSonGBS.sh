#!/bin/bash -l
#SBATCH --job-name=subset
#SBATCH --array=1-62%30
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 04:00:00
#SBATCH --mem=2GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/subsetgbs_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/subsetgbs_%A_%a.err

BAM=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  WGS_list3.txt | cut -f1)
sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" WGS_list3.txt | cut -f2)
OUTDIR=/home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset
BED=/home/hennelly/Chapter3/Alignment/bamfiles/final/GBS_merged_sorted_finished.bed

# subset to GBS intervals and remove reads flagged as PCR duplicates
module load samtools

samtools view -L ${BED} -b ${BAM} > ${OUTDIR}/${sample}_subsetonGBS.bam

samtools index ${OUTDIR}/${sample}_subsetonGBS.bam
