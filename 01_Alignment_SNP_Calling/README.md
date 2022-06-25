# Alignment and SNP Calling

## Move my GBS files to the Farm: 
```
 /mnt/amazon/MECU/20220212_CanidGBS/MergedRuns/ForLauren/
 
 S19-10678.merged.R1.fastq.gz - Central Karakoram National Park, Pakistan, near Jutal Village
 S19-10679.merged.R1.fastq.gz - Central Karakoram National Park, Pakistan
 S19-10680.merged.R1.fastq.gz - outskirts of Dera Ghazi Khan, Punjab, Pakistan
 S19-10681.merged.R1.fastq.gz - outskirts of Dera Ghazi Khan, Punjab, Pakistan
 S21-1031.merged.R1.fastq.gz - Shimshal, Gilgit-Baltistan, Pakistan
 S21-1036.merged.R1.fastq.gz - Dog, Motor way Islamabad 5km before Thalian interchange, Punjab, Pakistan
 S21-1037.merged.R1.fastq.gz - Kohlu, Baluchistan, Pakistan
 S21-1038.merged.R1.fastq.gz - Chitral Gol National Park, Khyber Pakhtunkhwa, Pakistan
 S21-1039.merged.R1.fastq.gz - Kallar Syedan, Punjab, Pakistan
 S21-1040.merged.R1.fastq.gz - Inzar, South Waziristan, Khyber Paktunkhwa, Pakistan
 S21-1041.merged.R1.fastq.gz - South Waziristan, Khyber Paktunkhwa, Pakistan
 S21-1042.merged.R1.fastq.gz - Chitral Gol National Park, Khyber Pakhtunkhwa, Pakistan
 S21-1047.merged.R1.fastq.gz - Chitral Gol National Park, Khyber Pakhtunkhwa, Pakistan
 S21-2743.merged.R1.fastq.gz - Arabian wolf from Israel
 extract14.merged.R1.fastq.gz - Shimshal, Gilgit-Baltistan, Pakistan
 extract45.merged.R1.fastq.gz - Golden Jackal, Mari-Mianwali, Punjab, Pakistan
 PakWolfext38.merged.R1.fastq.gz - Kolti-Satian-Murree  National Park, Punjab, Pakistan
 PakWolfext44.merged.R1.fastq.gz - Ara Bisharat-Chakwal, Punjab, Pakistan
```
Move into Farm 
```
rsync -avz -e "ssh -p 2022" --progress *fastq.gz hennelly@farm.cse.ucdavis.edu:/home/hennelly/Chapter3/GBSfiles
```



