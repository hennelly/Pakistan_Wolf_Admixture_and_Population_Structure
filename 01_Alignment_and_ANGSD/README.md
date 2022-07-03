# Alignment and Genotype Likelihoods using ANGSD 

## 1.0 Alignment to the Dog Genome
 - Trimming adapters from GBS data -  [01_Adapter_trimming.sh](/01_Alignment_and_ANGSD/01_Adapter_trimming.sh)
 - Alignment to the Dog Genome using bwa - [02_Alignment.sh](/01_Alignment_and_ANGSD/02_Alignment.sh)
 - Clean the bams files - [03_cleanbams.sh](/01_Alignment_and_ANGSD/03_cleanbams.sh)
     - this involved sorting the bam files, removing duplicates, and removing bad reads (duplicates, secondary alignments, mapQ<30)
 - Add readgroup headers and index - [04_readgroup.sh](/01_Alignment_and_ANGSD/04_readgroup.sh)
 
## 2.0 Subset GBS coordinates on whole genome sequence data 
- First, I need to merge all the GBS bam files to grab all coordinates, then convert this merged GBS bam file to a bed file and sort the bed file - [05_mergebams.sh](/01_Alignment_and_ANGSD/05_mergebams.sh)
- Second, I will then subset the WGS bam files to match the coordinates within the GBS files - [06_subsetWGSonGBS.sh](/01_Alignment_and_ANGSD/06_subsetWGSonGBS.sh)

## 3.0 Calculating genotype likelihoods using ANGSD 
 - Subset bam files to keep only the autosomal chromosomes - [07_keepautosomes.sh](/01_Alignment_and_ANGSD/07_keepautosomes.sh)
 - Next, I ran ANGSD on each chromosome using an array - [08_angsdbychr.sh](/01_Alignment_and_ANGSD/08_angsdbychr.sh)
 
