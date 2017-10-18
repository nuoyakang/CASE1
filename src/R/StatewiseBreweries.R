#read the raw data of brewery#
mergebeer <- read.csv("data/processed/BeersAndBreweries.csv", sep = ',')

#find out how many breweries are present in each state.
eachstate <- table(factor(mergebeer$State))
eachstate <- data.frame(eachstate)





