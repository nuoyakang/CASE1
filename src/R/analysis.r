#read the merged data with no missing values
mergebeerclean <- read.csv("data/processed/BeersAndBreweriesCleaned.csv", sep = ',')

#find the most alcoholic beer and most bitter beer for states
maxcalculation <- data.frame(mergebeerclean$ABV,mergebeerclean$IBU)
#use a function to find them and also not including the na values
colMax <- function(data) {sapply(data, max, na.rm = TRUE)}
colMax(maxcalculation)

#find the value and combine them together to one
maxabv <- mergebeerclean[which(mergebeerclean$ABV==0.125),]
maxabv <- maxabv[c(1,2,3,4,5,10)]
maxibu <- mergebeerclean[which(mergebeerclean$IBU==138),]
maxibu <- maxibu[c(1,2,3,4,5,10)]
maximum <- rbind(maxabv,maxibu)
maximum
