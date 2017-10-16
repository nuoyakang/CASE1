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

#find the first 6 and last 6
first6 <- head(mergebeer,6)
first6
last6 <- tail(mergebeer,6)
last6
#write the merged data to the processed file
write.csv(mergebeer,"C:/Users/Dell Eater/Nuoya's/SMU Nuoya/MSDS6306/CaseStudy1/data/processed/merged.csv", row.names = FALSE)

numberNA <- colSums(is.na(mergebeer))
numberNA <- data.frame(numberNA)
numberNA

#subset the data as state,ABV and IBU
subsetbeer<- data.frame(mergebeer$State,
												mergebeer$ABV,
												mergebeer$IBU)

#apply the function to find the median
MedianABV <- tapply(subsetbeer$mergebeer.ABV,subsetbeer$mergebeer.State,median)
MedianIBU <- tapply(subsetbeer$mergebeer.IBU,subsetbeer$mergebeer.State,median)

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

maxcalculation <- data.frame(mergebeer$ABV,mergebeer$IBU)
#use a function to find them and also not including the na values
colMax <- function(data) {sapply(data, max, na.rm = TRUE)}
colMax(maxcalculation)
#find the value and combine them
maxabv <- mergebeer[which(mergebeer$ABV==0.128),]
maxabv <- maxabv[c(1,2,3,4,5,10)]
maxibu <- mergebeer[which(mergebeer$IBU==138),]
maxibu <- maxibu[c(1,2,3,4,5,10)]
maximum <- rbind(maxabv,maxibu)
maximum

summaryABV <- summary(mergebeer$ABV)
summaryABV

library(ggplot2)
cor(mergebeer$IBU, mergebeer$ABV)

ggplot(mergebeer, aes(x=IBU, y=ABV)) + 
	geom_point(color = "orange red", size = 3)+
	geom_smooth(method=lm, se = FALSE, color = "black") +
	labs(x="International Bitterness Units of the beer", y="Alcohol by volume of the beer")