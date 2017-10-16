# Statewide Beer Availability Report
Nuoya & Meenu  
October 8, 2017  

### Introduction

This report summarizes the statistical analysis, analysis results and analysis plots associated with 2410 US craft beers and 588 US breweries inside United States of Ameirca. 

The purpose of this report is to illustrate data processing and modelling method used in this analysis as well as inferences and conclusions one can draw from it.

Project target is providing the analysis result to clients who want to invest in beer industy, with analysis results providing they will be able to have a general understanding of the local beer business trend of each state.

Project report including:

* statistical analysis:

	+ comparing the median alcohol content and international bitterness unit for each state

	+ finding the maximum alcoholic beer and the most bitter beer

	+ making judgement of the relationship between ABV and IBU from data provided.

* conclusion and references from the statistical analysis

### Analysis processes
1. Read 588 US breweries data sets into R and find out the number of breweries are present in each state.One can find the number of breweries of each state by checking eachstate output blow.

```r
#read the raw data of brewery#
brewery <- read.csv("C:/Users/Dell Eater/Nuoya's/SMU Nuoya/MSDS6306/CaseStudy1/data/raw/Breweries.csv", sep = ',')

#find out how many breweries are present in each state
eachstate <- table(factor(brewery$State))
eachstate <- data.frame(eachstate)
eachstate
```

```
##    Var1 Freq
## 1    AK    7
## 2    AL    3
## 3    AR    2
## 4    AZ   11
## 5    CA   39
## 6    CO   47
## 7    CT    8
## 8    DC    1
## 9    DE    2
## 10   FL   15
## 11   GA    7
## 12   HI    4
## 13   IA    5
## 14   ID    5
## 15   IL   18
## 16   IN   22
## 17   KS    3
## 18   KY    4
## 19   LA    5
## 20   MA   23
## 21   MD    7
## 22   ME    9
## 23   MI   32
## 24   MN   12
## 25   MO    9
## 26   MS    2
## 27   MT    9
## 28   NC   19
## 29   ND    1
## 30   NE    5
## 31   NH    3
## 32   NJ    3
## 33   NM    4
## 34   NV    2
## 35   NY   16
## 36   OH   15
## 37   OK    6
## 38   OR   29
## 39   PA   25
## 40   RI    5
## 41   SC    4
## 42   SD    1
## 43   TN    3
## 44   TX   28
## 45   UT    4
## 46   VA   16
## 47   VT   10
## 48   WA   23
## 49   WI   20
## 50   WV    1
## 51   WY    4
```

2. Read 2410 US craft beers data set into R and merge with brewery data set by the Brewery ID. After merging, I assign new column names to make the data set more understandable, show the first 6 beers and the last 6 beers. At the very end, write the processed data into the working directory. 

	+ The first 6 beers on the merged data are: 
	
		Beer Name     | Style                              | State| Breweries
		--------------|------------------------------------|------|-----------------
		Get Together  | American IPA                       | MN   |NorthGate Brewing
		Maggie's Leap | Milk / Sweet Stout                 | MN   |NorthGate Brewing
		Wall's End    | English Brown Ale                  | MN   |NorthGate Brewing
		Pumpion       | Pumpkin Ale                        | MN   |NorthGate Brewing
		Stronghold    | American Porter                    | MN   |NorthGate Brewing
		Parapet ESB   | Extra Special / Strong Bitter (ESB)| MN   |NorthGate Brewing
		
	+ The last 6 beers on the merged data are: 

		Beer Name                | Style                     | State| Breweries
		-------------------------|---------------------------|------|------------
		Pilsner Ukiah            | German Pilsener           | CA   |Ukiah Brewing Company
		Heinnieweisse Weissebier | Hefeweizen                | NY   |Butternuts Beer and Ale
		Snapperhead IPA          | American IPA              | NY   |Butternuts Beer and Ale
		Moo Thunder Stout        | Milk / Sweet Stout        | NY   |Butternuts Beer and Ale
		Porkslap Pale Ale        | American Pale Ale (APA)   | NY   |Butternuts Beer and Ale
		Urban Wilderness Pale Ale| English Pale Ale          | AK   |Sleeping Lady Brewing Company   

```r
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
```

```
##   Beer_ID     Beer Name                               Style   ABV IBU
## 1    2692  Get Together                        American IPA 0.045  50
## 2    2691 Maggie's Leap                  Milk / Sweet Stout 0.049  26
## 3    2690    Wall's End                   English Brown Ale 0.048  19
## 4    2689       Pumpion                         Pumpkin Ale 0.060  38
## 5    2688    Stronghold                     American Porter 0.060  25
## 6    2687   Parapet ESB Extra Special / Strong Bitter (ESB) 0.056  47
##   Ounces Brew_ID       Brewery Name        City State
## 1     16       1 NorthGate Brewing  Minneapolis    MN
## 2     16       1 NorthGate Brewing  Minneapolis    MN
## 3     16       1 NorthGate Brewing  Minneapolis    MN
## 4     16       1 NorthGate Brewing  Minneapolis    MN
## 5     16       1 NorthGate Brewing  Minneapolis    MN
## 6     16       1 NorthGate Brewing  Minneapolis    MN
```

```r
last6 <- tail(mergebeer,6)
last6
```

```
##      Beer_ID                 Beer Name                   Style   ABV IBU
## 2405      98             Pilsner Ukiah         German Pilsener 0.055  NA
## 2406      52  Heinnieweisse Weissebier              Hefeweizen 0.049  NA
## 2407      51           Snapperhead IPA            American IPA 0.068  NA
## 2408      50         Moo Thunder Stout      Milk / Sweet Stout 0.049  NA
## 2409      49         Porkslap Pale Ale American Pale Ale (APA) 0.043  NA
## 2410      30 Urban Wilderness Pale Ale        English Pale Ale 0.049  NA
##      Ounces Brew_ID                  Brewery Name          City State
## 2405     12     556         Ukiah Brewing Company         Ukiah    CA
## 2406     12     557       Butternuts Beer and Ale Garrattsville    NY
## 2407     12     557       Butternuts Beer and Ale Garrattsville    NY
## 2408     12     557       Butternuts Beer and Ale Garrattsville    NY
## 2409     12     557       Butternuts Beer and Ale Garrattsville    NY
## 2410     12     558 Sleeping Lady Brewing Company     Anchorage    AK
```

```r
#write the merged data to the processed file
write.csv(mergebeer,"C:/Users/Dell Eater/Nuoya's/SMU Nuoya/MSDS6306/CaseStudy1/data/processed/merged.csv", row.names = FALSE)
```

2. Summarise the number of missing values of each column. 

Column Name | Total Number of NA         
------------|--------------------
Beer_ID     | 	0          
Beer Name 	| 	0               
Style	    	| 	0            
ABV         | 	62        
IBU         | 	1005 
Ounces      | 	0        
Brew_ID     | 	0   
Brewery Name| 	0   
City     		| 	0    
State     	| 	0    


```r
numberNA <- colSums(is.na(mergebeer))
numberNA <- data.frame(numberNA)
numberNA
```

```
##              numberNA
## Beer_ID             0
## Beer Name           0
## Style               0
## ABV                62
## IBU              1005
## Ounces              0
## Brew_ID             0
## Brewery Name        0
## City                0
## State               0
```
3. Get the median alcohol content and international bitterness unit for each state. Plot out the bar chart for comparison of medians of each state.Please find the bar plot outputs(Blue is for median alcohol content and red is for international bitterness unit.) as well as the table for meidans of alcohol content and international bitterness unit. 


```r
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
```

```
##    states Median ABV Median IBU
## 1      AK     0.0560         NA
## 2      AL     0.0600         NA
## 3      AR     0.0520         NA
## 4      AZ         NA         NA
## 5      CA         NA         NA
## 6      CO         NA         NA
## 7      CT     0.0600         NA
## 8      DC     0.0625         NA
## 9      DE         NA         NA
## 10     FL         NA         NA
## 11     GA     0.0550         NA
## 12     HI     0.0540         NA
## 13     IA     0.0555         NA
## 14     ID     0.0565         NA
## 15     IL     0.0580         NA
## 16     IN         NA         NA
## 17     KS     0.0500         NA
## 18     KY         NA         NA
## 19     LA     0.0520         NA
## 20     MA     0.0540         NA
## 21     MD     0.0580         NA
## 22     ME     0.0510         NA
## 23     MI         NA         NA
## 24     MN     0.0560         NA
## 25     MO         NA         NA
## 26     MS     0.0580       45.0
## 27     MT         NA         NA
## 28     NC         NA         NA
## 29     ND     0.0500       32.0
## 30     NE         NA         NA
## 31     NH     0.0550         NA
## 32     NJ     0.0460       34.5
## 33     NM         NA         NA
## 34     NV         NA         NA
## 35     NY         NA         NA
## 36     OH     0.0580         NA
## 37     OK     0.0600         NA
## 38     OR     0.0560         NA
## 39     PA         NA         NA
## 40     RI     0.0550         NA
## 41     SC     0.0550         NA
## 42     SD     0.0600         NA
## 43     TN     0.0570         NA
## 44     TX         NA         NA
## 45     UT     0.0400         NA
## 46     VA     0.0565         NA
## 47     VT     0.0550         NA
## 48     WA     0.0555         NA
## 49     WI         NA         NA
## 50     WV     0.0620       57.5
## 51     WY     0.0500         NA
```

```r
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
```

![](caseanalysis_files/figure-html/draw the bar plot-1.png)<!-- -->

```r
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
```

![](caseanalysis_files/figure-html/draw the bar plot-2.png)<!-- -->

4. Find out the state that has the maximum alcoholic beer and the state that has the most bitter beer.

* The maximum alcoholic beer is Lee Hill Series Vol. 5(Belgian Style Quadrupel Ale).It is from co with ABV value 0.128

Beer Name   				    	 | Style                         | State | ABV value
---------------------------|-------------------------------|-------|-----------
Lee Hill Series Vol. 5     | Quadrupel (Quad)              | CO    | 0.128
	
* The most bitter beer is Bitter Bitch Imperial IPA.It is from OR with IBU value 138.

Beer Name   						     | Style           				       | State | IBU value
-----------------------------|-------------------------------|-------|-----------
Bitter Bitch Imperial IPA    | American Double / Imperial IPA| OR    | 138
			

```r
maxcalculation <- data.frame(mergebeer$ABV,mergebeer$IBU)
#use a function to find them and also not including the na values
colMax <- function(data) {sapply(data, max, na.rm = TRUE)}
colMax(maxcalculation)
```

```
## mergebeer.ABV mergebeer.IBU 
##         0.128       138.000
```

```r
#find the value and combine them
maxabv <- mergebeer[which(mergebeer$ABV==0.128),]
maxabv <- maxabv[c(1,2,3,4,5,10)]
maxibu <- mergebeer[which(mergebeer$IBU==138),]
maxibu <- maxibu[c(1,2,3,4,5,10)]
maximum <- rbind(maxabv,maxibu)
maximum
```

```
##      Beer_ID                                            Beer Name
## 375     2565 Lee Hill Series Vol. 5 - Belgian Style Quadrupel Ale
## 1857     980                            Bitter Bitch Imperial IPA
##                               Style   ABV IBU State
## 375                Quadrupel (Quad) 0.128  NA    CO
## 1857 American Double / Imperial IPA 0.082 138    OR
```
5. The following is to provide a statistical summary of the ABV values

Min  | 1st Quantile | Median | Mean  | 3rd Quantile | Max    | NA
-----|--------------|--------|-------|--------------|--------|----
0.001| 0.05000      | 0.056  |0.05677| 0.06700      | 0.12800| 62  

```r
summaryABV <- summary(mergebeer$ABV)
summaryABV
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
## 0.00100 0.05000 0.05600 0.05977 0.06700 0.12800      62
```


```r
library(ggplot2)
cor(mergebeer$IBU, mergebeer$ABV)
```

```
## [1] NA
```

```r
ggplot(mergebeer, aes(x=IBU, y=ABV)) + 
  geom_point(color = "orange red", size = 3)+
  geom_smooth(method=lm, se = FALSE, color = "black") +
  labs(x="International Bitterness Units of the beer", y="Alcohol by volume of the beer")
```

```
## Warning: Removed 1005 rows containing non-finite values (stat_smooth).
```

```
## Warning: Removed 1005 rows containing missing values (geom_point).
```

![](caseanalysis_files/figure-html/scatter plot-1.png)<!-- -->

### Conclusion and Inferences
