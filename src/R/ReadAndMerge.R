#read the Beer file and check the data
df_beer <- read.csv("data/raw/Beers.csv")
head(df_beer)
tail(df_beer)

#read the Breweries data file and check the data
df_breweries <- read.csv("data/raw/Breweries.csv")
head(df_breweries)
tail(df_breweries)

#Merge the data on Brew id and check the merged file
df_merge <- merge(df_beer, df_breweries, by.x="Brewery_id", by.y = "Brew_ID")
head(df_merge)
tail(df_merge)

#Give the columns more meaningful name
colnames(df_merge)[2] <- "Beer_name"
colnames(df_merge)[8] <- "Brew_name"
names(df_merge)

#Arrange the columns in proper order to make the data sensible
df_merge <- df_merge[c("Brewery_id","Brew_name","Beer_ID","Beer_name",
                       "ABV","IBU","Style","Ounces", "City","State")]

#Write the merged data in a csv file to be able to read for analysis later on
write.csv(df_merge,"data/processed/BeersAndBreweries.csv", row.names = FALSE)

#Check the row count before getting rid of blanks and NA's
nrow(df_merge)

#Get rid of blanks and NA from the data and check the row count and the data
df_merged <- na.omit(df_merge)
nrow(df_merged)

head(df_merged)
tail(df_merged)

#Write the merged data in a csv file to be able to read for analysis later on
write.csv(df_merged,"data/processed/BeersAndBreweriesCleaned.csv", row.names = FALSE)


