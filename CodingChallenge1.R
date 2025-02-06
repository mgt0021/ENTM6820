#Coding challenge 1: Intro to R

z <- c(1:200) #vector with values 1-200
mean(z) #mean of 100.5
sd(z) #sd of 57.87918

zlog <- c(z>30) #logical vector that is true for values of z greater than 30


zdf <- data.frame(z, zlog) #dataframe with z and zlog as columns
colnames(zdf) <- c("zvec", "zlogic") #renames column names
zdf$zsquared = (zdf$zvec)^2 #creates new col with squared values of z

#subset dataframe with two methods
subset(zdf,zsquared>10 & zsquared<100) #subset of z^2 between 10 and 100 using subset function
zdf[(zdf$zsquared>10) & (zdf$zsquared<100),] #subset of z^2 between 10 and 100 without using subset function
#subset of only row 26
zdf[26,]
#subset of row 180 that returns value of zquared for that row
zdf$zsquared[180]

#import data
tipsdf <- read.csv("C:/Users/mgt19/Documents/Classes/ENTM6820/TipsR.csv",na.strings = ".")
