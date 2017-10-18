#read the merged data with no missing values
mergebeerclean <- read.csv("data/processed/BeersAndBreweriesCleaned.csv", sep = ',')

#statistical summary of ABV
summaryABV <- summary(mergebeerclean$ABV)

