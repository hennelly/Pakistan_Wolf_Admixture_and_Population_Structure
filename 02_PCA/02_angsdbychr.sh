#!/bin/bash -l
#SBATCH --job-name=ang_pca
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 4-24:00:00
#SBATCH --array 1-38
#SBATCH --mem-per-cpu=10GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA_chr_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA_chr_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)
echo ${CHR}

REF=~/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=~/Chapter3/angsdPCA/scripts/bam_autosomes.txt
OUT=~/Chapter3/angsdPCA/bychr

module load angsd

angsd -out ${OUT}/angsd_${CHR}_output -bam ${LIST} -ref ${REF} -nThreads 2 \
    -GL 1 \
    -r ${CHR} \
    -trim 0 -C 50 -minMapQ 20 -minQ 20 -minInd 40 \
    -uniqueOnly 1 \
    -noTrans 1 -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6
       
##settings
# -r specifies genomic region
# -GL1 use samtools genotype likelihood method
# -doGlf output beagle likelihood format
# -minMapQ 20 -minQ20 filter out sites with low mapping quality or base quality
# -minInd - only keeps sites with information (at least one read) from N individuals



 
