library(dplyr)

# This data set provided the suicide rate across the world. This data shows the age rate that commit suicide per every 100,000 population
# in different countries. It also provided the age rate between female, male, and both sexes.

# read the data set "Suicide_Age"
# then filter down the data just to 8 different countries that I selected
dataset <- read.csv("age.csv") %>%
  filter(Location %in% c("Japan", "United States of America", "Mexico", "Philippines", "Democratic People's Republic of Korea", "Poland", "Singapore", "Qatar"))
  
# put the filtered data set into a new table call 'table_summary'
# then group the data set into 6 different values
# summaries the value by providing an easy read name
# then delete unnecessary values from the table
  table_summary <- dataset %>%
  group_by(Location) %>%
  summarize(min = min(Value),q1 = quantile(Value, 0.25), median = median(Value), mean = mean(Value), q3 = quantile(Value, 0.75), max = max(Value))
  table_summary[, c('Dim1', 'Dim2', 'Dim2ValueCode')] <- list(NULL)
  