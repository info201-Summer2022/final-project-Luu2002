library(dplyr)

# This data set provides information on mental health facilities rate across the world
# In this data set it has information on the mental hospitals, residential facilities and daily treatment

# read data frame "Facilities.csv"
# filter down the data to 8 different countries
dataframe <- read.csv("Facilities .csv") %>%
  filter(Country %in% c('Japan', 'United States of America', 'Mexico', 'Morocco', 'Cuba', 'Poland', 'Singapore', 'Qatar')) 

# store the filtered data into the new variable called, "table_summary"
# then group them by the column wanted
# summarize the name
# delete any unwanted columns
table_summary <- dataframe %>%
  group_by(Country, Year, Mental._hospitals, day._treatment, residential_facilities) %>%
  summarize(mental_hospitals = (Mental._hospitals), daily_treatment = (day._treatment))
  table_summary[, c("Mental._hospitals", "day._treatment")] <- list(NULL)
 

 
 
 
  