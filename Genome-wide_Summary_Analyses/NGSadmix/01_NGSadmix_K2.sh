#!/bin/bash -l
#SBATCH --job-name=NGSadmix_allchr_prune50_K2_2
#SBATCH --nodes 1
#SBATCH --ntasks 2
#SBATCH --time 5:00:00
#SBATCH --mem-per-cpu=30GB
#SBATCH -p bmh
#SBATCH -A ctbrowngrp
#SBATCH -o /home/sophiepq/GrayFoxWGS/GrayFox1/slurmlogs/NGSadmix_allchr_prune50_K2_2.out
#SBATCH -e /home/sophiepq/GrayFoxWGS/GrayFox1/slurmlogs/NGSadmix_allchr_prune50_K2_2.err

/home/sophiepq/bin/NGSadmix -likes ~/Chapter3/angsdPCA/beagle_autosomes/angsd_autosomes_output.beagle.gz -K 2 -o ~/Chapter3/NGSadmix/NGSadmix_allchr_prune50_K2_2 -P 10

/group/ctbrowngrp2/sophiepq/GrayFoxWGS/GrayFox1/slurmscripts

~/bin/NGSadmix -likes ~/GrayFoxWGS/GrayFox1/angsd/vcf/bychr/allchrs_header_prune50.beagle.gz -K 2 -o ~/GrayFoxWGS/GrayFox1/angsd/NGSadmix/NGSadmix_allchr_prune50_K2_2 -P 10

/group/ctbrowngrp2/sophiepq/GrayFoxWGS/GrayFox1/slurmscripts

