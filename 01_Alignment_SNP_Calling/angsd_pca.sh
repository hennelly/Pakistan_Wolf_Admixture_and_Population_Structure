#!/bin/bash -l
#SBATCH --job-name=angsd
#SBATCH --array=1-25,27,29-36,38%15
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 2-00:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/cbquinn/wolf2/slurmlogs/angsdpca_20220216_%a.out
#SBATCH -e /home/cbquinn/wolf2/slurmlogs/angsdpca_20220216_%a.err

module load angsd

REF=/home/cbquinn/wolf2/tempref/canFam3_withY.fa
BAMLIST=~/wolf2/6_gbs/bams_subset/ref/gbsbamlist_nodogsjackals366_38andX_rehead.txt
OUTDIR=~/wolf2/6_gbs/angsd/beagles/bychr/

angsd -out ${OUTDIR}${CHR}_gbs_nodogsjackals366_38andX_notrans_trim0_mapq30_min20_maf005 -bam ${BAMLIST} -ref $REF -nThreads 2 \
    -GL 2 \
    -trim 0 -C 50 -baq 1 \
    -minMapQ 30 -minQ 20 -minmaf 0.005 -minInd 330 \
    -uniqueOnly 1 -remove_bads 1 \
    -noTrans 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6
    
