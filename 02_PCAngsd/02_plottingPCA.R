###R

#Read on cov file from PCAngsd output
cov<-as.matrix(read.table("Autosomes_pca_noShimshal.cov"))

#Get eigenvalues and eigenvectors
e<-eigen(cov)
plot(e$vectors[,1:2])

e$values/sum(e$values)

#read in the sample list data
names<-read.csv("PCA_angsd_final.csv")

#assign the rownames of the covariance matix the 
rownames(cov)<-names$Sample

#remake the plot with the colors we want
plot(e$vectors[,1:2], pch=16)
text(e$vectors[,1:2],
     labels = row.names(cov),
     cex = 0.6, pos = 4, col = "red")
