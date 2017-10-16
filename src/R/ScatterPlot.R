
#Library for drawing a scatter plot
library(ggplot2)

#Read merged data
df_merged <- read.csv("data/processed/BeersAndBreweriesCleaned.csv")


#Relationship between the bitterness of the beer and its alcoholic content 
# shown in the scatter plot
#The plot shows a strong positive correlation between the bitterness of the beer to the 
#alcohol content of the beer

cor(df_merged$IBU, df_merged$ABV)

ggplot(df_merged, aes(x=IBU, y=ABV)) + 
  geom_point(color = "orange red", size = 3)+
  geom_smooth(method=lm, se = FALSE, color = "black") +
  labs(x="International Bitterness Units of the beer", y="Alcohol by volume of the beer")


