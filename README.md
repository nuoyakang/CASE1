This case study analyzes the dataset of beers and breweries.  The dataset is in a tidy format and values were already cleaned up.

Some information on how this data was collected can be found at
http://www.jeannicholashould.com/python-web-scraping-tutorial-for-craft-beers.html

It is not clear from the website if this dataset reports every single canned beer brewed in the US or not. 
To be safe, you will consider this dataset to be a sample that may contain biases.

There are 2410 beer entries in the beer dataset which contain the following information
Name: Name of the beer.
Beer ID: Unique identifier of the beer.
ABV: Alcohol by volume of the beer.
IBU: International Bitterness Units of the beer.
Brewery ID: Brewery id associated with the beer.
Style: Style of the beer.
Ounces: Ounces of beer.

The breweries dataset contain the following information about the breweries.
Brew ID: Unique identifier of the brewery.
Name: Name of the brewery.
City: City where the brewery is located.
State: U.S. State where the brewery is located.

The beers and the breweries are linked by Brew id.


The analysis of this project is a collaborative work by Meenu Ahluwalia and Nuoya Rezsonya.

We merged the Brews and Breweries dataset to have a more readable dataset which helped us in analysing the data easily.

We analyzed the data to help us answer questions like

a. number of breweries present for each state      
b. which columns in the dataset have missing values                
c. the state with the most alcoholic beer                
d. the state with the most bitter beer                                     
e. a quantile statistics for ABV (alcohol by volume of the beer)                           

Exploratory data analysis on the dataet :

(i) A scatter plot(BitternessVSAlcohol) showing correlation between the bitterness of the beer and its alcoholic content which can be found at reports/plots.
This plot uses ggplot2 library to plot the scatter plot                                       
While there is not a total positive correlation, they are still highly correlated. This is an interesting aspect that we can explore further down the road.                     

(ii) A bar chart(ABV barplot and IBU barplot) to compare the median alcohol content and international bitterness unit for each state (at reports/plots).                              

This analysis is an on-going process. 

Here are a few questions that we have gathered while doing this profiling which we hope to address in the next phase of the case study:

1. 41.7% of the IBU values are missing. Why is that? How can that affect our analysis?
2. There are two peaks in the IBU distribution. What explains this?
3. What explains the correlation between IBU and ABV? What is the influence of the beer style in this correlation?
4. Are there differences in the IBU, ABV or Style between geographical regions? What about the East Coast vs the West Coast?

