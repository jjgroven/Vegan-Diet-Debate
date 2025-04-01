library(cluster)

library(tm)
#install.packages("tm")
library(stringr)
library(wordcloud)
# ONCE: install.packages("Snowball")
## NOTE Snowball is not yet available for R v 3.5.x
## So I cannot use it  - yet...
##library("Snowball")
##set working directory
## ONCE: install.packages("slam")
library(slam)
library(quanteda)
## ONCE: install.packages("quanteda")
## Note - this includes SnowballC
library(SnowballC)
library(arules)
##ONCE: install.packages('proxy')
library(proxy)
library(cluster)
library(stringi)
library(proxy)
library(Matrix)
library(tidytext) # convert DTM to DF
library(plyr) ## for adply
library(ggplot2)
library(factoextra) # for fviz
library(mclust) # for Mclust EM clustering
library(textstem)  ## Needed for lemmatize_strings

library(amap)  ## for Kmeans
library(networkD3)
###############
normalized_CV <- read.csv("scaled_unlabeled_CV_data.csv")

distMatrix_C <- dist(normalized_CV, method="cosine")
print("cos sim matrix is :\n")
print(distMatrix_C) ##small number is less distant

#####k = 2
groups_C <- hclust(distMatrix_C,method="ward.D")
plot(groups_C, cex=.7, hang=-30,main = "Cosine Similarity (k = 2)")
rect.hclust(groups_C, k=2)


#####k = 3
groups_C <- hclust(distMatrix_C,method="ward.D")
plot(groups_C, cex=.7, hang=-30,main = "Cosine Similarity (k = 3)")
rect.hclust(groups_C, k=3)


#####k = 4
groups_C <- hclust(distMatrix_C,method="ward.D")
plot(groups_C, cex=.7, hang=-30,main = "Cosine Similarity (k = 4)")
rect.hclust(groups_C, k=4)
