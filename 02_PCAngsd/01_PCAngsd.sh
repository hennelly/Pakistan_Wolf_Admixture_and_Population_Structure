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
IN=~/Chapter3/angsdPCA/results.beagle.gz
OUTDIR=~/Chapter3/angsdPCA/pca_outputs

module load python
# Estimate covariance matrix for pca
python ${PCANGSD} -beagle ${IN} -o ${OUTDIR}/Autosomes_pca -threads 2

