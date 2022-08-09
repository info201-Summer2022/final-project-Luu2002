library(plotly)
mydata <- read.csv("~/Desktop/age.csv", header=FALSE)%>%
  select(V8, V24, V27, V30) %>%
  filter(V8 %in% c("united states", "Japan", "Mexico, philippines", "Korea", "Poland", "Singapore", "Qatar"))

Country <- c("united states", "Japan", "Mexico", "philippines", "Korea", "Poland", "Singapore", "Qatar")
V24 <- c(21.6, 16.1, 15.3, 15.3, 8.9, 8.1, 7.9, 3.5)
V27 <- c(6.5,7.5,9.2,7.6, 4.3, 6.2, 4,1.9)
V30 <- c(39.2, 25,21.8, 23.2, 13.3, 9.8, 11.8, 5)
mydata <- data.frame(V8, V24, V27, V30)

fig <- plot_ly(mydata, x = ~Country, y = ~V24, type = 'scatter', name = 'Both', mode = 'makers', marker = list(opacity = 1))
fig <- fig %>% add_trace(y = ~V27, name = 'Male')
fig <- fig %>% add_trace(y = ~V30, name = 'Female')
fig <- fig %>% layout(xaxis = list(showgrid = FALSE), yaxis = list(title = "Age"), title = "Average Suicide Age", barmode = 'group')

fig
