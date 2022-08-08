library(plotly)

# use the "plotly" package to create an interactive web based graphs
# read csv file
# select the column values wanted to work with
# filter down the certain country selected
dataset <- read.csv("Facilities.csv") %>%
  select(Country, Mental._hospitals, day._treatment, residential_facilities) %>%
  filter(Country %in% c('Japan', 'United States of America', 'Mexico', 'Morocco', 'Cuba', 'Poland', 'Singapore', 'Qatar')) 

# list out the values in each column
Mental._hospitals <- c(0.166, 8.314, 0.029, 0.032, 0.125, 0.038, 0.018, 0.189)
day._treatment <- c(0.445, 3.759, 0.079, 0.101, 0.716, 0, 0.115, 0.163)
residential_facilities <- c(1.213, 0.366, 0.012, 0,  0.069, 0.076, 0.054, 0)
dataset <- data.frame(Country, Mental._hospitals, day._treatment, residential_facilities)

# create a bar plot where xaxis is the country and the yaxis is the rate of each column values                     
fig <- plot_ly(dataset, x = ~Country, y = ~Mental._hospitals, type = 'bar', name = "Hospitals")
fig <- fig %>% add_trace(y = ~day._treatment, name = "Daily Treatment")
fig <- fig %>% add_trace(y = ~residential_facilities, name = "Residential Facilities")
fig <- fig %>% layout(yaxis = list(title = "rate"),title = 'Suicide By Mental Health', barmode = 'group')
fig

