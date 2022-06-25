#!/bin/bash -l
#SBATCH --job-name=GBS_alignment
#SBATCH --array=18
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2-6:00:00
#SBATCH --mem-per-cpu=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/projects/Chapter3/Alignment/slurmout/GBS_alignment_%A_%a.out
#SBATCH -e /home/hennelly/projects/Chapter3/Alignment/slurmout/GBS_alignment_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

# To create samples_align.txt, do:
# cat <(paste <(ls *R1_trimmed.fq.gz) <(ls *R1_trimmed.fq.gz | sed 's/.fq.gz//g') <(ls *R1_trimmed.fq.gz.fq.gz | sed 's/_.*//g')) > samples_align.txt

# Once this is done, change NUMBER in line 4 above to be the result of `wc -l < samples_align.txt`

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
R1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | awk -F"        " '{print $1}')
ID=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | awk -F"        " '{print $2}')
sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" samples_align.txt | awk -F"        " '{print $3}')

echo ${sample}

# load the bwa and samtools modules
module load bwa
module load samtools

# Align R1 and R2 
# Pipe to a bam file that excludes bad mapping scores
# Pipe to a sorted bam for merging

bwa mem -R "@RG\tID:${ID}\tSM:${ID}" /home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa ${R1} | \
samtools view -q 10 -h -b - | \
samtools sort -o /home/hennelly/Chapter3/Alignment/bamfiles/${sample}.bam -
