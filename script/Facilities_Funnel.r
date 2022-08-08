library(plotly)

# read data set for facilities
dataframe <- read.csv("Facilities.csv")

# use plotly to create a funnel chart for the 8 different countries
# comparing each country with different facilities and treatment 
fig <- plot_ly(
  type = "funnel",
  name = 'Mental Hospital',
  y = c("Japan", 'United States of America', 'Mexico', 'Morocco', 'Cuba', 'Poland', "Singapore", 'Qatar'), x = c(0.166, 8.314, 0.029, 0.032, 0.125, 0.038, 0.018, 0.189)) 
fig <- fig %>%
  add_trace(
    type = "funnel",
    name = 'Daily Treatment',
    y = c("Japan", 'United States of America', 'Mexico', 'Morocco', 'Cuba', 'Poland', "Singapore", 'Qatar'),
    x = c(0.445, 3.759, 0.079, 0.101, 0.716, 0.115, 0.163,0),
    textposition = "inside") 
fig <- fig %>%
  add_trace(
    type = "funnel",
    name = 'Residential Facilities',
    y = c("Japan", 'United States of America', 'Mexico', 'Morocco', 'Cuba', 'Poland', "Singapore", 'Qatar'),
    x = c(1.213, 0.366, 0.012, 0, 0.069, 0.076, 0.054,0),
    textposition = "outside") 
fig <- fig %>%
  layout(yaxis = list(categoryarray = c("Japan", 'United States of America', 'Mexico', 'Morocco', 'Cuba', 'Poland', "Singapore", 'Qatar')))

fig