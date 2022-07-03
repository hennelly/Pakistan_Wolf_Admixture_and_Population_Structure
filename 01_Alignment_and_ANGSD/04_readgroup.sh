#!/usr/bin/env bash
#SBATCH --job-name=replaceRG
#SBATCH --array=1-18
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 08:00:00
#SBATCH --mem=5GB
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/replaceRG_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/replaceRG_%A_%a.err
#SBATCH -p high
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

module load samtools 

# Once this is done, change NUMBER in line 4 above to be the result of `wc -l < samples_align.txt`
echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | cut -f3)
INDIR=/home/hennelly/Chapter3/Alignment/bamfiles/sorted
OUTDIR=/home/hennelly/Chapter3/Alignment/bamfiles/final
echo ${sample}

java -jar ~/bin/picard.jar AddOrReplaceReadGroups INPUT=${INDIR}/${sample}_sorted_nodups_cleaned.bam OUTPUT=${OUTDIR}/${sample}_sorted_nodups_cleaned_readgroup.bam VALIDATION_STRINGENCY=SILENT RGID=${sample} RGLB=1 RGPL=Thermo RGPU=NULL RGSM=${sample}

# index

samtools index ${OUTDIR}/${sample}_sorted_nodups_cleaned_readgroup.bam
