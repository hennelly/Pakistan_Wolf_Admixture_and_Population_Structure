#!/bin/bash -l
#SBATCH --job-name=HaplotypeCaller
#SBATCH --array=1-62%30
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4-20:00:00
#SBATCH --mem-per-cpu=16GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/HaplotypeCallerWGS_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/HaplotypeCallerWGS_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
R1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" WGS_bamlist.sh)

module load R
module load maven
module load java
module load GATK

 gatk --java-options "-Xmx16g" HaplotypeCaller  \
   -R /home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa \
   -I /home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset/${R1}_subsetonGBS.bam \
   -O /home/hennelly/Chapter3/Alignment/GVCFfiles/${R1}_subsetonGBS.g.vcf.gz \
   -ERC GVCF
