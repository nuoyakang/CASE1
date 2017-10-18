#read the merged data 
mergebeer <- read.csv("data/processed/BeersAndBreweries.csv", sep = ',')

#find the columns with missing values
numberNA <- colSums(is.na(mergebeer))
numberNA <- data.frame(numberNA)
numberNA
