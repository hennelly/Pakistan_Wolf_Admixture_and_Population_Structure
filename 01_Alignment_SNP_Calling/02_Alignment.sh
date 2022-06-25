#!/bin/bash -l
#SBATCH --job-name=GBS_alignment
#SBATCH --array=1-18
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2-6:00:00
#SBATCH --mem-per-cpu=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/GBS_alignment_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/GBS_alignment_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

# To create samples_align.txt, do:
# cat <(paste <(ls *R1_trimmed.fq.gz) <(ls *R1_trimmed.fq.gz | sed 's/.fq.gz//g') <(ls *R1_trimmed.fq.gz.fq.gz | sed 's/_.*//g')) > samples_align.txt

# Once this is done, change NUMBER in line 4 above to be the result of `wc -l < samples_align.txt`
S19-10678.merged.R1_trimmed.fq.gz
echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
READ1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | cut -f1)
ID=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | cut -f3)
sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | cut -f3)
REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
OUTDIR=/home/hennelly/Chapter3/Alignment/bamfiles
INDIR=/home/hennelly/Chapter3/Alignment/trimfastq
echo ${sample}

# load the bwa and samtools modules
module load bwa
module load samtools

# Align R1 and R2 
# Pipe to a bam file that excludes bad mapping scores
# Pipe to a sorted bam for merging

bwa mem ${REF} ${INDIR}/${READ1} | \
samtools view -q 10 -h -b - | \
samtools sort -o ${OUTDIR}/${sample}.bam -


