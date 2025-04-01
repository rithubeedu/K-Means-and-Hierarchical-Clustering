library(ggdendro)
library(tidyverse)
library(dplyr)

air.df<-read.csv("~/Downloads/EastWestAirlines.csv")
set.seed(1947)
str(air.df)
summary(air.df)
head(air.df)

# normalize input variables
air.df.norm <- scale(air.df[, sapply(air.df, is.numeric)])
head(air.df.norm)

# compute Euclidean distance
dist_scale <- dist(air.df.norm, method = "euclidean")
dist_scale

#Using ward
hclust_ward <- hclust(dist_scale, method="ward.D")
ggdendrogram(hclust_ward)

# Cut the tree at desired number of clusters
cutnum <- cutree(hclust_ward, k = 4)
cutnum

means_cluster <- data.frame(cutnum, air.df) %>%
  group_by(cutnum) %>%
  summarize(Balance=mean(Balance),
            Miles=mean(Qual_miles),
            C1Miles = mean(cc1_miles),
            C2Miles= mean(cc2_miles),
            C3Miles = mean(cc3_miles),
            BonusMiles = mean(Bonus_miles),
            BonusTrans  = mean(Bonus_trans),
            Flight12m   = mean(Flight_miles_12mo))
means_cluster

### Non-hierarchical Clustering: The 
# run kmeans algorithm
kmeans <- kmeans(air.df.norm, 4)
kmeans

##Characterizing clusters
cluster_meanskm <- data.frame(kmeans$cluster, air.df) %>%
  group_by(kmeans$cluster) %>%
  summarize(Balance=mean(Balance),
            Miles=mean(Qual_miles),
            C1Miles = mean(cc1_miles),
            C2Miles= mean(cc2_miles),
            C3Miles = mean(cc3_miles),
            BonusMiles = mean(Bonus_miles),
            BonusTrans  = mean(Bonus_trans),
            Flight12m   = mean(Flight_miles_12mo))
cluster_meanskm

# To calculate 5% of the total rows
new.df <- floor(0.95 * nrow(air.df.norm))

# Randomly sample 95% of the rows
air.95 <- air.df.norm[sample(1:nrow(air.df.norm), new.df), ]

# compute Euclidean distance
dist.new.scale <- dist(air.95, method = "euclidean")
dist.new.scale

#Using ward
hclust.ward <- hclust(dist.new.scale, method="ward.D")
ggdendrogram(hclust.ward)

# Cut the tree at desired number of clusters
cutnum <- cutree(hclust.ward, k = 4)
cutnum

cluster.means <- data.frame(cutnum, air.95) %>%
  group_by(cutnum) %>%
  summarize(Balance=mean(Balance),
            Miles=mean(Qual_miles),
            C1Miles = mean(cc1_miles),
            C2Miles= mean(cc2_miles),
            C3Miles = mean(cc3_miles),
            BonusMiles = mean(Bonus_miles),
            BonusTrans  = mean(Bonus_trans),
            Flight12m   = mean(Flight_miles_12mo))
cluster.means

### Non-hierarchical Clustering: The 
# run kmeans algorithm
kmeans <- kmeans(air.95, 4)
kmeans

##Characterizing clusters
cluster_means_km <- data.frame(kmeans$cluster, air.95) %>%
  group_by(kmeans$cluster) %>%
  summarize(Balance=mean(Balance),
            Miles=mean(Qual_miles),
            C1Miles = mean(cc1_miles),
            C2Miles= mean(cc2_miles),
            C3Miles = mean(cc3_miles),
            BonusMiles = mean(Bonus_miles),
            BonusTrans  = mean(Bonus_trans),
            Flight12m   = mean(Flight_miles_12mo))
cluster_means_km

