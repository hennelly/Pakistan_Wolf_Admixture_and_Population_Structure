#!/bin/bash -l
#SBATCH --job-name=abbaJK
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 00:30:00
#SBATCH --mem-per-cpu=500M
#SBATCH -p bmh
#SBATCH -A ctbrowngrp
#SBATCH -o /home/hennelly/Chapter3/Dstatistic/slurmout/angsd_JK_minQ30.out
#SBATCH -e /home/hennelly/Chapter3/Dstatistic/slurmout/angsd_JK_minQ30.err

module load angsd

Rscript /share/apps/angsd-0.934/R/jackKnife.R file=/home/hennelly/Chapter3/Dstatistic/results/abba_July52022_minQ30.abbababa indNames=/home/hennelly/Chapter3/angsdPCA/scripts/bam_autosomes_noShimshal.txt outfile=abba_July5th2022_minQ30.abbaJKout

