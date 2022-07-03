#!/bin/bash -l
#SBATCH --job-name=dhole
#SBATCH --nodes 2
#SBATCH --ntasks 5
#SBATCH --time 2-00:00:00
#SBATCH --mem-per-cpu=2GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/hennelly/Chapter3/Dstatistic/slurmout/anc_fasta.out
#SBATCH -e /home/hennelly/Chapter3/Dstatistic/slurmout/anc_fasta.err

BAM=/home/hennelly/Chapter3/angsdPCA/bams_autosomes/AADhole_SRR8049189_subsetonGBS_autosomes.bam

module load angsd

angsd -i ${BAM} -doFasta 1 -doCounts 1 -out ~/Chapter3/Dstatistic/ancestralfasta/dhole_mapped2canFam3_withY

