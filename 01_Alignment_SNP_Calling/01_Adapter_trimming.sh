#!/bin/bash -l
#SBATCH --job-name=trimgalore
#SBATCH --array=1-18 #number of samples you want to trim
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=6:00:00
#SBATCH --mem-per-cpu=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/trimgalore_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/trimgalore_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76,c11-93

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
R1=$(sed "${SLURM_ARRAY_TASK_ID}q;d" GBS_list.txt)

module load fastqc 
module load cutadapt

/home/hennelly/bin/TrimGalore-0.6.5/trim_galore --gzip -o /home/hennelly/Chapter3/Alignment/trimfastq ${R1} 
