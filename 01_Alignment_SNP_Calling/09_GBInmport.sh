#!/bin/bash -l
#SBATCH --job-name=gbdb
#SBATCH --array=1-40%30
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-00:00:00
#SBATCH --mem=20GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/hennelly/projects/GATK/slurmout/%A_%a.out
#SBATCH -e /home/hennelly/projects/GATK/slurmout/%A_%a.err

module load R
module load maven
module load java
module load GATK

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)
SAMPLEMAP=/home/hennelly/projects/GATK/scripts/mygcflist.txt
OUTDIR=/home/hennelly/projects/GATK/GenomeDBImport/
TEMPDIR=/home/hennelly/projects/GATK/scratch/

gatk --java-options "-Xmx20g -Xms20g" \
    GenomicsDBImport \
    --genomicsdb-workspace-path ${OUTDIR}${CHR}_gvcf_db \
    --batch-size 50 \
    -L ${CHR} \
    --sample-name-map ${SAMPLEMAP} \
    --tmp-dir=${TEMPDIR} 
