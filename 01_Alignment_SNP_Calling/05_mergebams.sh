### Code for subsetting WGS bams on the GBS bams

#!/bin/bash -l
#SBATCH --job-name=mergebams
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 04:00:00
#SBATCH --mem=2GB
#SBATCH -p bmm
#SBATCH -A ctbrowngrp
#SBATCH -o /home/cbquinn/wolf/slurmlogs/merge_bams_%a.out
#SBATCH -e /home/cbquinn/wolf/slurmlogs/merge_bams_%a.err

module load samtools

samtools merge GBS_merged.bam extract14_ShimshalGB_sorted_nodups_cleaned_readgroup.bam extract38_MurreePunjab_sorted_nodups_cleaned_readgroup.bam extract44_GoldenJackPak_sorted_nodups_cleaned_readgroup.bam extract45_ChakwalPunjab_sorted_nodups_cleaned_readgroup.bam S1910678_KarakoramPak_sorted_nodups_cleaned_readgroup.bam S1910679_KarakoramPak_sorted_nodups_cleaned_readgroup.bam  S1910680_DGKhanPak_sorted_nodups_cleaned_readgroup.bam S1910681_DGKhanPak_sorted_nodups_cleaned_readgroup.bam S211031_ShimshalGB_sorted_nodups_cleaned_readgroup.bam S211036_DogIslambad_sorted_nodups_cleaned_readgroup.bam  S211037_KohluBaluch_sorted_nodups_cleaned_readgroup.bam S211038_ChitralGol_sorted_nodups_cleaned_readgroup.bam S211039_KallarSyedanPunjab_sorted_nodups_cleaned_readgroup.bam S211040_SouthWaziristan_sorted_nodups_cleaned_readgroup.bam S211041_SouthWaziristan_sorted_nodups_cleaned_readgroup.bam S211042_ChitralGol_sorted_nodups_cleaned_readgroup.bam S211047_ChitralGol_sorted_nodups_cleaned_readgroup.bam 2743_Israelwolf_sorted_nodups_cleaned_readgroup.bam 

# convert bam to bed file 

module load samtools

samtools view GBS_merged.bam  | awk '{print $3"\t"$4"\t"$4+120}' > GBS_merged.bed

