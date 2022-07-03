#!/bin/bash -l
#SBATCH --job-name=ang_abba
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 3-00:00:00
#SBATCH --mem-per-cpu=2GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Dstatistic/slurmout/abbababa.out
#SBATCH -e /home/hennelly/Chapter3/Dstatistic/slurmout/abbababa.err

ANC=/home/hennelly/Chapter3/Dstatistic/ancestralfasta/dhole_mapped2canFam3_withY.fa.gz
REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=~/Chapter3/angsdPCA/scripts/bam_autosomes_noShimshal.txt
OUT=~/Chapter3/Dstatistic/results/abba_July32022

module load angsd

angsd -out ${OUT} -bam ${LIST} -ref ${REF} -anc ${ANC} -nThreads 2 \
    -GL 1 \
    -trim 0 -C 50 \
    -minMapQ 20 -minQ 20 -minInd 41 \
    -uniqueOnly 1 \
    -doMajorMinor 1 -doMaf 1 \
    -doCounts 1 \
    -doHaploCall 1 \
    -doAbbababa 1 \
    -SNP_pval 1e-6



