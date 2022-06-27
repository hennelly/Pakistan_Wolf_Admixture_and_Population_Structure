#!/bin/bash -l
#SBATCH --job-name=jointg
#SBATCH --array=1-40
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 6-00:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/GenotypeGVCF_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/GenotypeGVCF_%A_%a.err

module load R
module load maven
module load java

export PATH=$PATH:/home/hennelly/Chapter3/bin/gatk-4.2.6.0

CHR=$(sed "${SLURM_ARRAY_TASK_ID}q;d" /home/hennelly/projects/GATK/scripts/chromosome_lengths.txt | cut -f1)
REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
GENDB=/home/hennelly/Chapter3/Alignment/GenomeDBImport/
OUTDIR=/home/hennelly/Chapter3/Alignment/GenotypeGATK/
TEMPDIR=/home/hennelly/projects/GATK/scratch_GenotypeGATK/

cd $GENDB
gatk --java-options "-Xmx4g" GenotypeGVCFs \
   -R ${REF} \
   -V gendb://${CHR}_gvcf_db \
   -O ${OUTDIR}gatk_${CHR}.vcf.gz \
   --tmp-dir ${TEMPDIR}
