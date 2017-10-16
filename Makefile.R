# Set working directory
setwd("/SMU/MyProjects/CASE1")

# Gather and cleanup raw data files
# The R file below read csv data files from the data/raw folder in the project,
# merges the data, writes the merged data to data/processed folder under "BeersAndBreweries.csv" name.
# This file also gets rid of the blanks and the NA's from the merged data
# and writes this file as "BeersAndBreweriesCleaned.csv" to data/processed folder

source("src/R/ReadAndMerge.R")

#Shows a relationship between the bitterness of the beer and its alcoholic content
#by drawing a scatter plot
# required library(ggplot2)
library(ggplot2)
plot <- source("src/R/ScatterPlot.R")
plot
