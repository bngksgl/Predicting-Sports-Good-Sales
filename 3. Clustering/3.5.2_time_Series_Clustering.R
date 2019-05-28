#install.packages('TSclust')
#install.packages('dtw')
#install.packages('clusterCrit')
library(clusterCrit)
getwd()
setwd('C:/Users/Bengi/Desktop/ddmm2')

library(TSclust)
library(dtw)
library(stats)

#This is inpired by:
#http://alexminnaar.com/time-series-classification-and-clustering-with-python.html
#https://datawookie.netlify.com/blog/2017/04/clustering-time-series-data/



#This dataset is created in the python and used in R
data_read=read.csv('data_clustering_R')
rownames(data_read)=data_read$key
drops=c('key','X')
data_read_2=data_read[,!(names(data_read) %in% drops)]

#We are using dtw matrix. This took, 2.5 days to run.
distMatrix=dist(data,method='DTW') 
distmat=as.matrix((distMatrix))
write.csv(distmat,file='3.5.2_dtw_distantmatrix.csv')


distant_matrix <- fread("3.5.2_dtw_distantmatrix.csv")
cluster_ward=agnes(distant_matrix, method ='ward')
cluster_ward$ac


clust <- cutree(cluster_ward, k = 5)
table(clust)

clust <- cutree(cluster_ward, k = 7)
table(clust)
write.csv(clust, file = "3.5.2_result_clust_7.csv")

clust <- cutree(cluster_ward, k = 8)
table(clust)

clust <- cutree(cluster_ward, k = 9)
table(clust)

clust <- cutree(cluster_ward, k = 10)
table(clust)

clust <- cutree(cluster_ward, k = 11)
table(clust)

clust <- cutree(cluster_ward, k =12 )
length(clust)
table(clust)
write.csv(clust, file = "clust_12.csv")







        
        
        
        