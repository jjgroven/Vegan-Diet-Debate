library("amap")  
library(tm)
library(stringr)
library(wordcloud)
#library("Snowball")
library(slam)
library(quanteda)
library(SnowballC)
library(arules)
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
library(networkD3)
library(arulesViz)
setwd("/Users/jessicagroven/Desktop/Text Mining/TM Project")

library(Matrix)

# Inspect the transactions
inspect(transactions[1:10])
###Loading whole data set###
dataARM <- read.transactions("transactionData.csv",
                             rm.duplicates = FALSE,
                             format = "basket",
                             sep=",",
                             skip = 1
                             
)
class(dataARM)
arules::inspect(dataARM[1:10])  # View the first 10 transactions



#####PERFORMING ARM on whole data set#####

rules = arules::apriori(dataARM, parameter = list(support=.0350,
                                                  confidence=.03, minlen=2))
arules::inspect(rules)

SortedRules <- sort(rules, by="support", decreasing=TRUE)
arules::inspect(SortedRules[1:15])

SortedRules <- sort(rules, by="confidence", decreasing=TRUE)
arules::inspect(SortedRules[1:15])

SortedRules <- sort(rules, by="lift", decreasing=TRUE)
arules::inspect(SortedRules[1:15])


rules = arules::apriori(dataARM, parameter = list(support=.03950,
                                                  confidence=.03, minlen=2))
arules::inspect(rules)

plot(rules, method = "graph",
     measure = "confidence", shading = "lift")


ramenRules <- apriori(data=dataARM,parameter = list(supp=.03, conf=.03, minlen=2),
                     appearance = list(default="rhs", lhs="ramen"),
                     control=list(verbose=FALSE))
ramenRules <- sort(ramenRules, decreasing=TRUE, by="lift")
arules::inspect(ramenRules [1:10])


plot(ramenRules, method = "graph",
     measure = "confidence", shading = "lift")


petaRules <- apriori(data=dataARM,parameter = list(supp=.01, conf=.01, minlen=2),
                      appearance = list(default="rhs", lhs="peta"),
                      control=list(verbose=FALSE))
petaRules <- sort(petaRules, decreasing=TRUE, by="lift")
arules::inspect(petaRules [1:10])


plot(petaRules, method = "graph",
     measure = "confidence", shading = "lift")
