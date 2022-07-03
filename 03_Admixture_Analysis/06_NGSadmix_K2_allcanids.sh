#!/bin/bash -l
#SBATCH --job-name=NGSadmix_allchr_K2
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu=30GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/NGSadmix/slurmout/NGSadmix_allchr_K2_allcanids.out
#SBATCH -e /home/hennelly/Chapter3/NGSadmix/slurmout/NGSadmix_allchr_K2_allcanids.err

/home/sophiepq/bin/NGSadmix -likes ~/Chapter3/ANGSD/beagle_autosomes/angsd_autosomes_wolvesdogsothercanids_output.beagle.gz -K 2 -o ~/Chapter3/NGSadmix/results/NGSadmix_allchr_allcanids_K2 -P 10
