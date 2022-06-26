# Alignment and SNP Calling

## 1.0 Alignment to the Dog Genome
 - Trimming adapters from GBS data -  [01_Adapter_trimming.sh](/01_Alignment_SNP_Calling/01_Adapter_trimming.sh)
 - Alignment to the Dog Genome using bwa - [02_Alignment.sh](/01_Alignment_SNP_Calling/02_Alignment.sh)
 - Clean the bams files - [03_cleanbams.sh](/01_Alignment_SNP_Calling/03_cleanbams.sh)
     - this involved sorting the bam files, removing duplicates, and removing bad reads (duplicates, secondary alignments, mapQ<30)
 - Add readgroup headers and index - [04_readgroup.sh](/01_Alignment_SNP_Calling/04_readgroup.sh)
 
## Subset GBS coordinates on whole genome sequence data 

