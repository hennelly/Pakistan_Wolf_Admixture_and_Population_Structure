#!/bin/bash -l
#SBATCH --job-name=removeind
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 10:00:00
#SBATCH --mem=8GB
#SBATCH -p high
#SBATCH -o /home/hennelly/Chapter3/FinalDataset/slurmout/removeind_onlywolves.out
#SBATCH -e /home/hennelly/Chapter3/FinalDataset/slurmout/removeind_onlywolves.err

module load vcftools

vcftools --minQ 30 \
--remove-indv S1910681_DGKhanPak  \
--remove-indv S211031_ShimshalGB \
--remove-indv extract45_ChakwalPunjab \
--remove-indv S211040_SouthWaziristan \
--remove-indv extract44_GoldenJackPak \
--remove-indv extract38_MurreePunjab \
--remove-indv AADhole_SRR8049189_subsetGBS \
--remove-indv Dog_SRR1061818_subsetGBS \
--remove-indv Dog_SRR1061963_subsetGBS \
--remove-indv Dog_SRR1061964_subsetGBS \
--remove-indv GoldenJackalBH127_subsetGBS \
--remove-indv S211036_DogIslambad \
--remove-indv SRR10596312_Dingo_subsetGBS \
--remove-indv SRR11085401_YushuDog_subsetGBS \
--remove-indv SRR1134655_GermanShephard_subsetGBS \
--remove-indv SRR1138360_TibetanMastiff_subsetGBS \
--remove-indv SRR1138361_TibetanMastiff_subsetGBS \
--remove-indv SRR12009563_SalukiIran_subsetGBS \
--remove-indv SRR12009564_SalukiIran_subsetGBS \
--remove-indv SRR12009565_Irandog_subsetGBS \
--remove-indv SRR1518518_Dog_subsetGBS \
--remove-indv SRR3574870_Coyote_subsetGBS \
--remove-indv SRR7976417_Redwolf_subsetGBS \
--remove-indv SRR7976426_Africanwolf_subsetGBS \
--remove-indv SRR8049190_Ethiopian_subsetGBS \
--vcf /home/hennelly/Chapter3/Alignment/GenotypeGATK/Autosomes_gatkfilter_noindels.vcf \
--out /home/hennelly/Chapter3/FinalDataset/vcffiles/Autosomes_onlywolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3 \
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
--remove-indv Dog_SRR1061818_subsetGBS \
--remove-indv Dog_SRR1061963_subsetGBS \
--remove-indv Dog_SRR1061964_subsetGBS \
--remove-indv GoldenJackalBH127_subsetGBS \
--remove-indv S211036_DogIslambad \
--remove-indv SRR10596312_Dingo_subsetGBS \
--remove-indv SRR11085401_YushuDog_subsetGBS \
--remove-indv SRR1134655_GermanShephard_subsetGBS \
--remove-indv SRR1138360_TibetanMastiff_subsetGBS \
--remove-indv SRR1138361_TibetanMastiff_subsetGBS \
--remove-indv SRR12009563_SalukiIran_subsetGBS \
--remove-indv SRR12009564_SalukiIran_subsetGBS \
--remove-indv SRR12009565_Irandog_subsetGBS \
--remove-indv SRR1518518_Dog_subsetGBS \
--remove-indv SRR3574870_Coyote_subsetGBS \
--remove-indv SRR7976417_Redwolf_subsetGBS \
--remove-indv SRR7976426_Africanwolf_subsetGBS \
--remove-indv SRR8049190_Ethiopian_subsetGBS \
--vcf /home/hennelly/Chapter3/Alignment/GenotypeGATK/Wholegenome_gatkfilter_noindels.vcf \
--out /home/hennelly/Chapter3/FinalDataset/vcffiles/WholeGenome_OnlyWolves_gatkfilter_noindels_minQ30_maxmissing0.9_mac3 \
--max-missing 0.9 \
--mac 3 \
--recode \
--recode-INFO-all
