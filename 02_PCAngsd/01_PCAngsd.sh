#!/bin/bash -l
#SBATCH --job-name=pcangsd_autosomes
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu=60GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/angsdPCA/slurmout/pcangsd_noshimshal.out
#SBATCH -e /home/hennelly/Chapter3/angsdPCA/slurmout/pcangsd_noshimshal.err

PCANGSD=/home/cbquinn/bin/pcangsd/pcangsd.py
IN=~/Chapter3/ANGSD/beagle_autosomes/angsd_autosomes_Eurasianwolves_output.beagle.gz
OUTDIR=~/Chapter3/angsdPCA/pca_outputs

module load python
# Estimate covariance matrix for pca
python ${PCANGSD} -beagle ${IN} -o ${OUTDIR}/Autosomes_pca_noShimshal -threads 2

