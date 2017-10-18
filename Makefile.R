# Set working directory
setwd("/SMU/MyProjects/CASE1")

# Gather and cleanup raw data files
# The R file below read csv data files from the data/raw folder in the project,
# merges the data, writes the merged data to data/processed folder under "BeersAndBreweries.csv" name.
# This file also gets rid of the blanks and the NA's from the merged data
# and writes this file as "BeersAndBreweriesCleaned.csv" to data/processed folder

source("src/R/ReadAndMerge.R")


# Analysis on the dataset

# number of breweries for each state
eachstate <- source("src/R/StatewiseBreweries.R")
eachstate

# missing values in the data set
numberNA <- source("src/R/MissingValues.R")
numberNA

#Bar charts for the median alcohol content and international bitterness unit for each state.
source("src/R/BarChart.R")
dev.off()

# State with the most maximum alcoholic (ABV) beer, state with the most bitter (IBU) beer
maximum <- source("src/R/analysis.r")
maximum

#Summary statistics for the ABV variable
summaryABV <- source("src/R/ABVSummary.R")
summaryABV

# Shows a relationship between the bitterness of the beer and its alcoholic content
# by drawing a scatter plot
# required library(ggplot2)
library(ggplot2)
plot <- source("src/R/ScatterPlot.R")
plot
