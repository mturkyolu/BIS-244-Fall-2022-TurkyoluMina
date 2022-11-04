#   Failure to clone/link COVID-19 repo: -10

# correct way to Import data into dataframe
us_counties <- read_csv(here("covid-19-data","live","us-counties.csv"))
us_counties_recent <- read_csv(here("covid-19-data","us-counties-recent.csv"))
us_counties_2020 <- read_csv(here("covid-19-data","us-counties-2020.csv"))
us_counties_2021 <- read_csv(here("covid-19-data","us-counties-2021.csv"))
us_counties_2022 <- read_csv(here("covid-19-data","us-counties-2022.csv"))

# Importing us counties 2020
library(readr)
us_counties_2020 <- read_csv("Documents/GitHub/BIS-244-Fall-2022-TurkyoluMina/covid-19-data/us-counties-2020.csv")
View(us_counties_2020)

# importing us counties 2021
library(readr)
us_counties_2021 <- read_csv("Documents/GitHub/BIS-244-Fall-2022-TurkyoluMina/covid-19-data/us-counties-2021.csv")
View(us_counties_2021)

# importing us counties 2022
library(readr)
us_counties_2022 <- read_csv("Documents/GitHub/BIS-244-Fall-2022-TurkyoluMina/covid-19-data/us-counties-2022.csv")
View(us_counties_2022)

# importing us counties recent
library(readr)
us_counties_recent <- read_csv("Documents/GitHub/BIS-244-Fall-2022-TurkyoluMina/covid-19-data/us-counties-recent.csv")
View(us_counties_recent)

# importing us counties from live file
library(readr)
us_counties <- read_csv("Documents/GitHub/BIS-244-Fall-2022-TurkyoluMina/covid-19-data/live/us-counties.csv")
View(us_counties)

# binding countries
countiesInOrder <- rbind(us_counties_2020,us_counties_2021,us_counties_2022,us_counties_recent,us_counties)

# filter for Lehigh counties
Lehigh<- filter(countiesInOrder, county=="Lehigh" & state=="Pennsylvania")
View(Lehigh)

# removing duplicates
library("dplyr")
Lehigh <- distinct(Lehigh,date, .keep_all=TRUE)
View(Lehigh)

# number of new cases per day
Lehigh$incr_cases <-2
n<-length(Lehigh$date)
Lehigh$incr_cases[1]<- Lehigh$cases[1]

# calculating values
for (i in 2:n) {
  Lehigh$incr_cases[i] <- (Lehigh$cases[i]-Lehigh$cases[i-1]) 
}
View(Lehigh)

library(gapminder)
library(tidyverse)
library(socviz)
# Lehigh cases graph
GraphLehigh <- ggplot(data=Lehigh, mapping=aes(x=date, y=incr_cases))
GraphLehigh+ geom_line(color="blue") + labs(x="Date", y="New Cases Reported", title="COVID-19 Cases Reported in Lehigh, PA")

