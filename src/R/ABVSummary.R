#read the merged data with no missing values
mergebeerclean <- read.csv("data/processed/BeersAndBreweriesCleaned.csv", sep = ',')

#statistical summary of ABV from the cleaned and merged data
summaryABV <- summary(mergebeerclean$ABV)

