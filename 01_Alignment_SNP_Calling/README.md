# Alignment and SNP Calling

## 1.0 Alignment to the Dog Genome
 - Trimming adapters from GBS data -  [01_Adapter_trimming.sh](/01_Alignment_SNP_Calling/01_Adapter_trimming.sh)
 - Alignment to the Dog Genome using bwa - [02_Alignment.sh](/01_Alignment_SNP_Calling/02_Alignment.sh)
 - Clean the bams files - [03_cleanbams.sh](/01_Alignment_SNP_Calling/03_cleanbams.sh)
     - this involved sorting the bam files, removing duplicates, and removing bad reads (duplicates, secondary alignments, mapQ<30)
 - Add readgroup headers and index - [04_readgroup.sh](/01_Alignment_SNP_Calling/04_readgroup.sh)
 
## 2.0 Subset GBS coordinates on whole genome sequence data 
- First, I need to merge all the GBS bam files to grab all coordinates, then convert this merged GBS bam file to a bed file and sort the bed file - [05_mergebams.sh](/01_Alignment_SNP_Calling/05_mergebams.sh)
- Second, I will then subset the WGS bam files to match the coordinates within the GBS files - [06_subsetWGSonGBS.sh](/01_Alignment_SNP_Calling/06_subsetWGSonGBS.sh)

## 3.0 SNP calling with GATK 
- Convert bam files to GenotypeCaller files, which I did for the subsetted WGS - [07_HaplotypeCaller_WGS.sh](/01_Alignment_SNP_Calling/07_HaplotypeCaller_WGS.sh) and GBS samples [08_HaplotypeCaller_GBSdata.sh](/01_Alignment_SNP_Calling/08_HaplotypeCaller_GBSdata.sh) 
- etc
