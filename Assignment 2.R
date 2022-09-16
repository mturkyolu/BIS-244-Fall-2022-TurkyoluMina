
library(dplyr)
filter_data <- filter(us_states,state=="Pennsylvania")
View(filter_data)

# Cases
n <- length(filter_data$date)
filter_data$incr_cases <- 2

View(filter_data)
for (i in 2:n) {
  filter_data$incr_cases[i] <- (filter_data$cases[i]-filter_data$cases[i-1]) 
}

View(filter_data)

# Death
n <- length(filter_data$date)
filter_data$incr_deaths <- 0

View(filter_data)
for (i in 2:n) {
  filter_data$incr_deaths[i] <- (filter_data$deaths[i]-filter_data$deaths[i-1]) 
}

View(filter_data)

# Standard Deviation
sd(filter_data$incr_cases)


