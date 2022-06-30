Autosomes_output.beagle.gz

#!/bin/bash -l
#SBATCH --job-name=pcangsd_autosomes
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu=60GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/pcangsd.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/pcangsd.err

PCANGSD=/home/cbquinn/bin/pcangsd/pcangsd.py
IN=~/Chapter3/angsdPCA/Autosomes_output.beagle.gz
OUTDIR=~/Chapter3/angsdPCA/pca_outputs

module load python
# Estimate covariance matrix for pca
python ${PCANGSD} -beagle ${IN} -o ${OUTDIR}/Autosomes_pca -threads 2






#!/bin/bash -l
#SBATCH --job-name=ang_pca
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 3-24:00:00
#SBATCH --mem-per-cpu=10GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA_try2.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/angsdPCA_try2.err


REF=/home/hennelly/fastqfiles/DogRefwithY/genomes/canFam3_withY.fa
LIST=/home/hennelly/Chapter3/angsdPCA/scripts/bam_autosomes.txt
OUT=/home/hennelly/Chapter3/angsdPCA/beagle_autosomes

module load angsd

angsd -out ${OUT}/angsd_autosomes_output -bam ${LIST} -ref ${REF} -nThreads 2 \
    -GL 1 \
    -trim 0 -C 50 -remove_bads 0 -removeOnly 1 \
    -minMapQ 20 -minQ 20 -minInd 40 \
    -doGlf 2 -doMajorMinor 1 -doMaf 1 \
    -SNP_pval 1e-6
    
    
    
    
  
