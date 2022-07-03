#!/bin/bash -l
#SBATCH --job-name=NGSadmix_allchr_K6
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu=30GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/NGSadmix/slurmout/NGSadmix_allchr_K6.out
#SBATCH -e /home/hennelly/Chapter3/NGSadmix/slurmout/NGSadmix_allchr_K6.err

/home/sophiepq/bin/NGSadmix -likes ~/Chapter3/ANGSD/beagle_autosomes/angsd_autosomes_Eurasianwolves_output.beagle.gz -K 6 -o ~/Chapter3/NGSadmix/results/NGSadmix_allchr_K6_noShimshal -P 10

