#!/bin/bash -l
#SBATCH --job-name=tenHaplotypeCaller
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --array=1-18
#SBATCH --time=4-20:00:00
#SBATCH --mem=20GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/HaplotypeCallerGBS_disable_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/HaplotypeCallerGBS_disable_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

BAMDIR=/home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" GBS_list_GATK.txt)
echo ${sample}

module load R
module load maven
module load java

export PATH=$PATH:/home/hennelly/Chapter3/bin/gatk-4.2.6.0

 gatk --java-options "-Xmx20g" HaplotypeCaller  \
   -R /home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa \
   -I ${BAMDIR}/${sample}_sorted_cleaned_readgroup.bam \
   -O /home/hennelly/Chapter3/Alignment/GVCFfiles/${sample}_disable.g.vcf.gz \
   -ERC GVCF \
   --read-filter AllowAllReadsReadFilter
   
   --disable-tool-default-read-filters true
   
   disable-read-filter

#!/bin/bash -l
#SBATCH --job-name=hapcaller
#SBATCH --array=1-410%20
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10-00:00:00
#SBATCH --mem=16GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/cbquinn/wolf2/slurmlogs/%A_%a.out
#SBATCH -e /home/cbquinn/wolf2/slurmlogs/%A_%a.err

module load R
module load maven
module load java
module load GATK

WORKDIR=~/wolf2/3_variants/gbs/gatk/gvcfs/
TEMPDIR=~/wolf/tempdir/
REF=~/wolf/tempref/canFam3.fa
SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/wolf2/3_variants/gbs/gatk/gvcfs/mybamlist.txt | cut -f2)
BAMIN=$(sed "${SLURM_ARRAY_TASK_ID}q;d" ~/wolf2/3_variants/gbs/gatk/gvcfs/mybamlist.txt | cut -f1)

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "Creating intermediate hapltoype gVCF file for sample $SAMPLE using bam $BAMIN"

gatk HaplotypeCaller \
-R ${REF} \
-ERC GVCF \
-mbq 30 \
-I ${BAMIN} \
-O ${WORKDIR}${SAMPLE}.g.vcf.gz
