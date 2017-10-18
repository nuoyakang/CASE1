mergebeerclean <- read.csv("data/processed/BeersAndBreweriesCleaned.csv", sep = ',')

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

x11()#draw the bar plot pf abv in a separate window
par(mar=c(18, 4.1, 4.1, 2.1), mgp=c(3, 1, 0), las=2) #http://rfunction.com/archives/1302

bp <- barplot(finalmedian$`Median ABV`,
              ylab ='States',
              xlab  ='Median Alcohol Content',
              ylim = c(0,55),
              col = 'blue',
              horiz=T, 
              density = 50,
              las = 1)

x11()
#draw the bar plot pf IBU in a  separate window
par(mar=c(18, 4.1, 4.1, 2.1), mgp=c(3, 1, 0), las=2) #http://rfunction.com/archives/1302

bp <- barplot(finalmedian$`Median IBU`,
              ylab ='States',
              xlab  ='Median Bitterness Content',
              ylim = c(0,55),
              col = 'red',
              horiz=T, 
              density = 50,
              las = 1)

