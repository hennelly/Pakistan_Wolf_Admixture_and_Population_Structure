#!/bin/bash -l
#SBATCH --job-name=GBS_bamclean
#SBATCH --array=1-18
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2-6:00:00
#SBATCH --mem-per-cpu=8GB
#SBATCH -p high
#SBATCH -o "/home/hennelly/Chapter3/Alignment/slurmout/bamsorted_%A_%a.out"
#SBATCH -e "/home/hennelly/Chapter3/Alignment/slurmout/bamsorted_%A_%a.err"
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

module load samtools 

# Once this is done, change NUMBER in line 4 above to be the result of `wc -l < samples_align.txt`
echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | cut -f3)
INDIR=/home/hennelly/Chapter3/Alignment/bamfiles
echo ${sample}

samtools sort ${INDIR}/${sample}.bam | \
samtools view -o ${INDIR}/temp/${sample}_sorted.bam -

# mark duplicates 
java -jar /home/hennelly/bin/picard.jar MarkDuplicates \
      I=${INDIR}/temp/${sample}_sorted.bam \
      O=${INDIR}/sorted/{sample}_sorted_nodups.bam \
      M=${INDIR}/${sample}_metrics.txt

# remove bad reads (duplicates, secondary alignments, mapQ<30)
samtools view -hb -F 256 -q 30 ${INDIR}/sorted/${sample}_sorted_nodups_cleaned_temp.bam | \
samtools view -hb -F 1024 > ${INDIR}/sorted/${sample}_sorted_nodups_cleaned.bam
