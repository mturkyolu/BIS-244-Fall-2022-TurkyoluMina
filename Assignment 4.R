install.packages(tidyverse)
library(tidyverse)
library(gapminder)
library(dplyr)

WOT <- read.csv("Documents/GitHub/BIS-244-Fall-2022-TurkyoluMina/WOT.csv")
View(WOT)

filter_games = filter(WOT, Battles > 3)
View(filter_games)

filter_games$WR<- as.numeric(gsub("%", "" ,filter_games$WR, fixed=TRUE))

p1 <- ggplot(data = filter_games,
                mapping = aes(x = reorder(Nation, WR, na.rm = TRUE), y = WR, group=Nation)) + 
  labs (x = "Nation Played", y = "Win Rate (WR)", title= "Stats by Nation Played") + geom_boxplot()

p2 <- ggplot(data = filter_games,
                mapping = aes(x = reorder(Class, WR, na.rm = TRUE), y = WR)) + 
  labs (x= "Type Played", y = "Win Rate (WR)", title= "Stats by Type Played") + geom_boxplot()

install.packages("patchwork")
library(patchwork)

p1+p2