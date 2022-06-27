#!/bin/bash -l
#SBATCH --job-name=gbdb
#SBATCH --array=1-78%40
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 3-00:00:00
#SBATCH --mem=20GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/GenomeDBImport_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmoutGenomeDBImport_%A_%a.err

module load R
module load maven
module load java

export PATH=$PATH:/home/hennelly/Chapter3/bin/gatk-4.2.6.0

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)
SAMPLEMAP=/home/hennelly/Chapter3/Alignment/scripts/myGVCFlist_tab.txt
OUTDIR=/home/hennelly/Chapter3/Alignment/GenomeDBImport/
TEMPDIR=/home/hennelly/Chapter3/Alignment/scratch_GBDImport/

gatk --java-options "-Xmx20g -Xms20g" \
    GenomicsDBImport \
    --genomicsdb-workspace-path ${OUTDIR}${CHR}_gvcf_db \
    --batch-size 50 \
    -L ${CHR} \
    --sample-name-map ${SAMPLEMAP} \
    --tmp-dir=${TEMPDIR} 
