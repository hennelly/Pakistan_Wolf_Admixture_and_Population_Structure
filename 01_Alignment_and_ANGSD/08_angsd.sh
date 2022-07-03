#!/bin/bash -l
#SBATCH --job-name=ang_pca
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 3-24:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/ANGSD/slurmout/ANGSD.out
#SBATCH -e /home/hennelly/Chapter3/ANGSD/slurmout/ANGSD.err

REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=/home/hennelly/Chapter3/ANGSD/scripts/bam_autosomes_noShimshal.txt
OUT=/home/hennelly/Chapter3/ANGSD/beagle_autosomes

module load angsd

angsd -out ${OUT}/angsd_autosomes_Eurasianwolves_output -bam ${LIST} -ref ${REF} -nThreads 2 \
    -GL 1 \
    -trim 0 -C 50 -remove_bads 0 -uniqueOnly 1 \
    -minMapQ 20 -minQ 20 -minInd 41 \
    -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6
    
##settings
# -r specifies genomic region
# -GL1 use samtools genotype likelihood method
# -doGlf output beagle likelihood format
# -minMapQ 20 -minQ20 filter out sites with low mapping quality or base quality
# -minInd - only keeps sites with information (at least one read) from N individuals



#!/bin/bash -l
#SBATCH --job-name=bam_subset
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --array 1-2
#SBATCH --time 1-2:00:00
#SBATCH --mem=1GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/bam_subset_%A_%a.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/bam_subset_%A_%a.err

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

SAMPLE=$(sed "${SLURM_ARRAY_TASK_ID}q;d" bamlist_poorPakwolves.txt)
echo ${SAMPLE}
DIR=/home/hennelly/Chapter3/Alignment/bamfiles_WGSsubset
DIROUT=/home/hennelly/Chapter3/angsdPCA/bams_autosomes
BEDIN=chr_keep.bed

module load bedtools

bedtools intersect -abam ${DIR}/${SAMPLE}.bam -b ${BEDIN} > ${DIROUT}/${SAMPLE}_autosomes.bam




/home/hennelly/Chapter3/angsdPCA/bams_autosomes/SRR7976426_Africanwolf_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/SRR8049190_Ethiopian_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/S211036_DogIslambad_sorted_cleaned_readgroup_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/Dog_SRR1061818_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/Dog_SRR1061964_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/Dog_SRR1061963_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/GoldenJackalBH127_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/SRR10596312_Dingo_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/SRR12009563_SalukiIran_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/SRR12009565_Irandog_subsetonGBS_autosomes.bam
/home/hennelly/Chapter3/angsdPCA/bams_autosomes/SRR3574870_Coyote_subsetonGBS_autosomes.bam



#!/bin/bash -l
#SBATCH --job-name=ang_pca
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 3-24:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/ANGSD/slurmout/ANGSD_othercanids.out
#SBATCH -e /home/hennelly/Chapter3/ANGSD/slurmout/ANGSD_othercanids.err


REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=/home/hennelly/Chapter3/ANGSD/scripts/bam_autosomes_othercanids.txt
OUT=/home/hennelly/Chapter3/ANGSD/beagle_autosomes

module load angsd

angsd -out ${OUT}/angsd_autosomes_wolvesdogsothercanids_output -bam ${LIST} -ref ${REF} -nThreads 2 \
    -GL 1 \
    -trim 0 -C 50 -remove_bads 0 -uniqueOnly 1 \
    -minMapQ 20 -minQ 20 -minInd 50 \
    -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6
    
##settings
# -r specifies genomic region
# -GL1 use samtools genotype likelihood method
# -doGlf output beagle likelihood format
# -minMapQ 20 -minQ20 filter out sites with low mapping quality or base quality
# -minInd - only keeps sites with information (at least one read) from N individuals

bam_autosomes_othercanids.txt

