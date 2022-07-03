#!/bin/bash -l
#SBATCH --job-name=ang_pca
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 3-24:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA_try2.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA_try2.err


REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=/home/hennelly/Chapter3/angsdPCA/scripts/bam_autosomes.txt
OUT=/home/hennelly/Chapter3/angsdPCA/beagle_autosomes

module load angsd

angsd -out ${OUT}/angsd_autosomes_output -bam ${LIST} -ref ${REF} -nThreads 2 \
    -GL 1 \
    -trim 0 -C 50 -remove_bads 0 -uniqueOnly 1 \
    -minMapQ 20 -minQ 20 -minInd 41 \
    -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6
    
##settings
# -r specifies genomic region
# -GL1 use samtools genotype likelihood method
# -doGlf output beagle likelihood format
# -minMapQ 20 -minQ20 filter out sites with low mapping quality or base quality
# -minInd - only keeps sites with information (at least one read) from N individuals
