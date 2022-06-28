# Plotting PCA in R

library(ggplot2)
library(ggrepel)

dat <- read.csv ("PCA_March242022_graywolves.csv", header=TRUE)

pdf ("PCA_March242022_graywolves.pdf", height=10, width=15)
p <- ggplot(dat,aes(x=PC1,y=PC2,color=Population)) + geom_point(size = 3)  + theme_classic()  
p + geom_label_repel(aes(label=Sample), size=2)
dev.off()
