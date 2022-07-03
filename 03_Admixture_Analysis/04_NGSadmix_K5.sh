#!/bin/bash -l
#SBATCH --job-name=NGSadmix_allchr_K5
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu=30GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/NGSadmix/slurmout/NGSadmix_allchr_K5.out
#SBATCH -e /home/hennelly/Chapter3/NGSadmix/slurmout/NGSadmix_allchr_K5.err

/home/sophiepq/bin/NGSadmix -likes ~/Chapter3/angsdPCA/beagle_autosomes/angsd_autosomes_output.beagle.gz -K 5 -o ~/Chapter3/NGSadmix/results/NGSadmix_allchr_K5 -P 10
