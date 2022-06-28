#!/bin/bash -l
#SBATCH --job-name=removeind
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/FinalDataset/slurmout/removeind_onlywolvesanddogs.out
#SBATCH -e /home/hennelly/Chapter3/FinalDataset/slurmout/removeind_onlywolvesanddogs.err

module load vcftools

vcftools --minQ 30 \
--remove-indv S1910681_DGKhanPak  \
--remove-indv S211031_ShimshalGB \
--remove-indv extract45_ChakwalPunjab \
--remove-indv S211040_SouthWaziristan \
--remove-indv extract44_GoldenJackPak \
--remove-indv extract38_MurreePunjab \
--remove-indv AADhole_SRR8049189_subsetGBS \
--remove-indv GoldenJackalBH127_subsetGBS \
--remove-indv SRR3574870_Coyote_subsetGBS \
--remove-indv SRR7976417_Redwolf_subsetGBS \
--remove-indv SRR7976426_Africanwolf_subsetGBS \
--remove-indv SRR8049190_Ethiopian_subsetGBS \
--vcf /home/hennelly/Chapter3/Alignment/GenotypeGATK/Autosomes_gatkfilter_noindels.vcf \
--out /home/hennelly/Chapter3/FinalDataset/vcffiles/Autosomes_onlywolvesandDogs_gatkfilter_noindels_minQ30_maxmissing0.9_mac3 \
--max-missing 0.9 \
--mac 3 \
--recode \
--recode-INFO-all

vcftools --minQ 30 \
--remove-indv S1910681_DGKhanPak  \
--remove-indv S211031_ShimshalGB \
--remove-indv extract45_ChakwalPunjab \
--remove-indv S211040_SouthWaziristan \
--remove-indv extract44_GoldenJackPak \
--remove-indv extract38_MurreePunjab \
--remove-indv AADhole_SRR8049189_subsetGBS \
--remove-indv GoldenJackalBH127_subsetGBS \
--remove-indv SRR3574870_Coyote_subsetGBS \
--remove-indv SRR7976417_Redwolf_subsetGBS \
--remove-indv SRR7976426_Africanwolf_subsetGBS \
--remove-indv SRR8049190_Ethiopian_subsetGBS \
--vcf /home/hennelly/Chapter3/Alignment/GenotypeGATK/Wholegenome_gatkfilter_noindels.vcf \
--out /home/hennelly/Chapter3/FinalDataset/vcffiles/WholeGenome_OnlyWolvesandDogs_gatkfilter_noindels_minQ30_maxmissing0.9_mac3 \
--max-missing 0.9 \
--mac 3 \
--recode \
--recode-INFO-all
