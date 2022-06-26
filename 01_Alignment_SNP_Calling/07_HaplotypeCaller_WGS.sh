#!/bin/bash -l
#SBATCH --job-name=tenHaplotypeCaller
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --array=1-62%30
#SBATCH --time=4-20:00:00
#SBATCH --mem=20GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/HaplotypeCallerWGS_again_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/HaplotypeCallerWGS_again_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

BAMDIR=/home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" WGS_bamlist.txt)
echo ${GVCFname}

TEMPDIR=/home/hennelly/Chapter3/Alignment/tempdir/

export PATH=$PATH:home/hennelly/Chapter3/bin/gatk-4.2.6.0

module load R
module load maven
module load java

 gatk --java-options "-Xmx20g" HaplotypeCaller  \
   -R /home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa \
   -I ${BAMDIR}/${sample}_subsetonGBS.bam \
   -O /home/hennelly/Chapter3/Alignment/GVCFfiles/${sample}_subsetGBS.g.vcf.gz \
   -ERC GVCF \
   --tmp-dir ${TEMPDIR}
   
   
