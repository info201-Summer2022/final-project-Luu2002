library(dplyr)

dataset <- read.csv("Suicide_Age.csv") %>%
  filter(Location %in% c('Japan', 'United States of America', 'Mexico', 'Philippines', 'Korea', 'Poland', 'Singapore', 'Qatar'))
  
table_summary <- dataset %>%
    group_by(Location, Period, Dim1, FactValueNumeric, FactValueNumericLow, FactValueNumericHigh) %>%
    summarize(Gender = (Dim1), Avg_rate = (FactValueNumeric), Low_rate = (FactValueNumericLow), High_rate = (FactValueNumericHigh))
    table_summary[, c("Dim1", "FactValueNumeric","FactValueNumericLow", "FactValueNumericHigh")] <- list(NULL)



