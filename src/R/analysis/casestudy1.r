setwd("C:/Users/Dell Eater/Nuoya's/SMU Nuoya/MSDS6306/CaseStudy1")
brewery <- read.csv('Breweries.csv', sep = ',')
numberBrewery <- unique(brewery)

beer <- read.csv('Beers.csv', sep = ',')
colnames(beer) <- c('Name','Beer_ID','ABV','IBU','Brew_ID','Style','Ounces')
brewery$Brew_ID <- rownames(brewery)
mergebeer <- merge(beer,brewery,by = 'Brew_ID',all = FALSE)
mergebeer <- mergebeer[c(3,2,6,4,5,7,1,8,9,10)]
colnames(mergebeer)[2] <- 'Beer Name'
colnames(mergebeer)[8] <- 'Brewery Name'
first6 <- head(mergebeer,6)
last6 <- tail(mergebeer,6)

numberNA <- colSums(is.na(mergebeer))
numberNA

subsetbeer<- data.frame(mergebeer$State,
												mergebeer$ABV,
												mergebeer$IBU)

MedianABV <- tapply(subsetbeer$mergebeer.ABV,subsetbeer$mergebeer.State,median)
MedianIBU <- tapply(subsetbeer$mergebeer.IBU,subsetbeer$mergebeer.State,median)

MedianABV <-data.frame(MedianABV)
MedianIBU <-data.frame(MedianIBU)
finalmedian <- cbind(MedianABV,MedianIBU )

colnames(finalmedian) <- c('Median ABV','Median IBU')
finalmedian$states <- rownames(finalmedian)
finalmedian <- finalmedian[c(3,1,2)]
rownames(finalmedian) <- NULL
finalmedian


par(mar=c(18, 4.1, 4.1, 2.1), mgp=c(3, 1, 0), las=2) #http://rfunction.com/archives/1302

bp <- barplot(finalmedian$`Median ABV`,
							ylab ='States',
							xlab  ='Median Alcohol Content',
							ylim = c(0,55),
							col = 'blue',
							horiz=T, 
							density = 50,
							las = 1)

maxcalculation <- data.frame(mergebeer$ABV,mergebeer$IBU)

colMax <- function(data) {sapply(data, max, na.rm = TRUE)}
colMax(maxcalculation)

maxabv <- mergebeer[which(mergebeer$ABV==0.128),]
maxabv <- maxabv[c(1,2,3,4,5,10)]
maxibu <- mergebeer[which(mergebeer$IBU==138),]
maxibu <- maxibu[c(1,2,3,4,5,10)]
maximum <- rbind(maxabv,maxibu)
maximum

summaryABV <- summary(mergebeer$ABV)
summaryABV

IBUcontent <- mergebeer$IBU
ABVcontent <- mergebeer$ABV
linearABVIBU <- plot(ABVcontent~IBUcontent)

