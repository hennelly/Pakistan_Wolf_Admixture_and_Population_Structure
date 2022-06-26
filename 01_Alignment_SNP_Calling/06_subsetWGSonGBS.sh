#!/bin/bash -l
#SBATCH --job-name=subset
#SBATCH --array=1-25
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 04:00:00
#SBATCH --mem=2GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/cbquinn/wolf/slurmlogs/subsetgbs_rescale_%a.out
#SBATCH -e /home/cbquinn/wolf/slurmlogs/subsetgbs_rescale_%a.err

WORKDIR=~/wolf2/6_gbs/bams_subset/historical/mapdam_recalibrated/
SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d"  ~/wolf2/2_align/historical/aln/deduped/histbamlist.txt | cut -f1)
BAMIN=~/wolf2/2_align/historical/aln/mapdamage/results_${SAMPLE}/${SAMPLE}.rescaled.bam
REF=/home/cbquinn/wolf2/tempref/canFam3_withY.fa

# subset to GBS intervals and remove reads flagged as PCR duplicates

cd $WORKDIR
module load samtools
samtools view -L ~/wolf2/6_gbs/bams_subset/gbsbed.bed -F 1024 -b $BAMIN > ${SAMPLE}.rescaled.gbs.bam
samtools index ${SAMPLE}.rescaled.gbs.bam
