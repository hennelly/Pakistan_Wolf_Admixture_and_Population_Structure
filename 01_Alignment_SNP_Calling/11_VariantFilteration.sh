#!/bin/bash -l
#SBATCH --job-name=filterGATK
#SBATCH --array=1-40
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 6-00:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/VariantFiltration_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/VariantFiltration_%A_%a.err

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)

module load R
module load maven
module load java

export PATH=$PATH:/home/hennelly/Chapter3/bin/gatk-4.2.6.0

gatk VariantFiltration \
    -V gatk_${CHR}.vcf.gz \
    -filter "QD < 2.0" --filter-name "QD2" \
    -filter "SOR > 3.0" --filter-name "SOR3" \
    -filter "FS > 60.0" --filter-name "FS60" \
    -filter "MQ < 40.0" --filter-name "MQ40" \
    -filter "MQRankSum < -12.5"  --filter-name "MQRankSum-12.5" \
    -filter "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
    -O gatk_${CHR}_filtered.vcf.gz
