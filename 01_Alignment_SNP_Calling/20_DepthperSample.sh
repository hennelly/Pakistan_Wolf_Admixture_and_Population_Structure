#!/bin/bash -l
#SBATCH --job-name=depth
#SBATCH --array=1-18
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 012:00:00
#SBATCH --mem=2GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/Alignment/slurmout/depthDec6_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/Alignment/slurmout/depthDec6_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" GBS_list_GATK.txt)
echo ${sample}

module load samtools

samtools depth /home/hennelly/Chapter3/Alignment/bamfiles/sorted/${sample}_sorted_nodups_cleaned.bam  |  awk '{sum+=$3} END { print "Average = ",sum/NR}' > /home/hennelly/Chapter3/Alignment/DepthperSample/depth_${sample}_sorted_nodups_cleaned.txt

_sorted_nodups
_sorted_nodups_cleaned

#!/bin/bash -l
#SBATCH --job-name=depth
#SBATCH --array=1-18
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 012:00:00
#SBATCH --mem=2GB
#SBATCH -p high
#SBATCH -o /home/hennelly/projects/Chapter3/Alignment/slurmout/depthDec6_%A_%a.out
#SBATCH -e /home/hennelly/projects/Chapter3/Alignment/slurmout/depthDec6_%A_%a.err
#SBATCH --exclude=c10-96,c10-69,c11-76

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

sample=$(sed "${SLURM_ARRAY_TASK_ID}q;d" GBS_list_GATK.txt)
echo ${sample}

module load samtools

samtools depth /home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset/${sample}_sorted_nodups_cleaned_readgroup.bam  |  awk '{sum+=$3} END { print "Average = ",sum/NR}' > /home/hennelly/projects/Chapter3/Alignment/DepthperSample/depth_${sample}.txt


GBS_list_GATK.txt
