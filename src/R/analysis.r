#read the raw data of brewery#
brewery <- read.csv("C:/Users/Dell Eater/Nuoya's/SMU Nuoya/MSDS6306/CaseStudy1/data/raw/Breweries.csv", sep = ',')

#find out how many breweries are present in each state
eachstate <- table(factor(brewery$State))
eachstate <- data.frame(eachstate)
eachstate

#read the raw data of beer data set
beer <- read.csv("C:/Users/Dell Eater/Nuoya's/SMU Nuoya/MSDS6306/CaseStudy1/data/raw/Beers.csv", sep = ',')
colnames(beer) <- c('Name','Beer_ID','ABV','IBU','Brew_ID','Style','Ounces')

#merge them by brewery ID
brewery$Brew_ID <- rownames(brewery)
mergebeer <- merge(beer,brewery,by = 'Brew_ID',all = FALSE)
mergebeer <- mergebeer[c(3,2,6,4,5,7,1,8,9,10)]
colnames(mergebeer)[2] <- 'Beer Name'
colnames(mergebeer)[8] <- 'Brewery Name'

#cleaning the data, sort out first 6 and last 6
mergebeerclean <- na.omit(mergebeer)
#find the first 6 and last 6
first6 <- head(mergebeer,6)
first6
last6 <- tail(mergebeer,6)
last6

numberNA <- colSums(is.na(mergebeer))
numberNA <- data.frame(numberNA)
numberNA

subsetbeer<- data.frame(mergebeerclean$State,
												mergebeerclean$ABV,
												mergebeerclean$IBU)

#apply the function to find the median
MedianABV <- tapply(subsetbeer$mergebeerclean.ABV,subsetbeer$mergebeerclean.State,median)
MedianIBU <- tapply(subsetbeer$mergebeerclean.IBU,subsetbeer$mergebeerclean.State,median)

#combine the together
MedianABV <-data.frame(MedianABV)
MedianIBU <-data.frame(MedianIBU)
finalmedian <- cbind(MedianABV,MedianIBU)

#adjust the names and make a finalmedian dataframe
colnames(finalmedian) <- c('Median ABV','Median IBU')
finalmedian$states <- rownames(finalmedian)
finalmedian <- finalmedian[c(3,1,2)]
rownames(finalmedian) <- NULL
finalmedian

#draw the bar plot pf abv
par(mar=c(18, 4.1, 4.1, 2.1), mgp=c(3, 1, 0), las=2) #http://rfunction.com/archives/1302

bp <- barplot(finalmedian$`Median ABV`,
							ylab ='States',
							xlab  ='Median Alcohol Content',
							ylim = c(0,55),
							col = 'blue',
							horiz=T, 
							density = 50,
							las = 1)

#draw the bar plot pf IBU
par(mar=c(18, 4.1, 4.1, 2.1), mgp=c(3, 1, 0), las=2) #http://rfunction.com/archives/1302

bp <- barplot(finalmedian$`Median IBU`,
							ylab ='States',
							xlab  ='Median Alcohol Content',
							ylim = c(0,55),
							col = 'red',
							horiz=T, 
							density = 50,
							las = 1)
#plot = df.state.value_counts().plot(kind='bar', title="Number of Breweries in Each State", \	figsize=(8,6), colormap='summer')
#plot.set_xlabel('State')
#plot.set_ylabel('Number of Breweries')
#mean_line = plot.axhline(df.state.value_counts().mean(), color='r',\ label='Average Number of Breweries')
#plt.legend()


#find the most alcoholic beer and most bitter beer
maxcalculation <- data.frame(mergebeerclean$ABV,mergebeerclean$IBU)
#use a function to find them and also not including the na values
colMax <- function(data) {sapply(data, max, na.rm = TRUE)}
colMax(maxcalculation)
#find the value and combine them
maxabv <- mergebeerclean[which(mergebeerclean$ABV==0.125),]
maxabv <- maxabv[c(1,2,3,4,5,10)]
maxibu <- mergebeerclean[which(mergebeerclean$IBU==138),]
maxibu <- maxibu[c(1,2,3,4,5,10)]
maximum <- rbind(maxabv,maxibu)
maximum

#statistical summary of ABV
summaryABV <- summary(mergebeerclean$ABV)
summaryABV

#scatter plot of the linear
library(ggplot2)
cor(mergebeer$IBU, mergebeer$ABV)

ggplot(mergebeer, aes(x=IBU, y=ABV)) + 
	geom_point(color = "orange red", size = 3)+
	geom_smooth(method=lm, se = FALSE, color = "black") +
	labs(x="International Bitterness Units of the beer", y="Alcohol by volume of the beer")