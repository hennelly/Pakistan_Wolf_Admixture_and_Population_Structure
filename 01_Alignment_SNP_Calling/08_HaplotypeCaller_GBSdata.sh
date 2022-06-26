#!/bin/bash -l
#SBATCH --job-name=freebayes
#SBATCH --array=1-39
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=4-20:00:00
#SBATCH --mem-per-cpu=16GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/freebayes_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/freebayes_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

module load freebayes
module load bcftools

REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)

freebayes -f ${REF} \
--min-base-quality 20 \
--min-mapping-quality 30 \
--region ${CHR} \
/home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset/*.bam \
> /home/hennelly/Chapter3/Alignment/vcffiles/freebayes_${CHR}.vcf

