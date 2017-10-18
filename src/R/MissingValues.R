#read the merged data 
mergebeer <- read.csv("data/processed/BeersAndBreweries.csv", sep = ',')

#find the number of missing values for each column
numberNA <- colSums(is.na(mergebeer))
numberNA <- data.frame(numberNA)
numberNA
