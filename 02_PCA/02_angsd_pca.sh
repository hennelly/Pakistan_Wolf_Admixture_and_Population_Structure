#!/bin/bash -l
#SBATCH --job-name=ang_pca
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 24:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA.err

STARTTIME=$(date +%s)

REF=~/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=~/Chapter3/angsdPCA/scripts/bam_autosomes.txt
OUT=~/Chapter3/angsdPCA/results

module load angsd

angsd -out ${OUT} -bam ${LIST} -ref ${REF} -nThreads 2 \
    -GL 1 \
    -trim 0 -C 50 -baq 1 \
    -minMapQ 20 -minQ 20 -minInd 40 \
    -uniqueOnly 1 -remove_bads 1 \
    -noTrans 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6

ENDTIME=$(date +%s)
TIMESPEND=$(($ENDTIME - $STARTTIME))
((sec=TIMESPEND%60,TIMESPEND/=60, min=TIMESPEND%60, hrs=TIMESPEND/60))
timestamp=$(printf "%d:%02d:%02d" $hrs $min $sec)
echo "Took $timestamp hours:minutes:seconds to complete..."



