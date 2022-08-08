library(plotly)
age <- read.csv("~/Desktop/age.csv", header=FALSE)%>%
  select(V8, V13, V14, V16) %>%
  filter(V8 %in% c("united states", "Japan", "Mexico, philippines", "Korea", "Poland", "Singapore", "Qatar"))
V13 <- c(21.6, 16.1, 15.3, 15.3, 8.9, 8.1, 7.9, 3.5)
V14 <- c(6.5,7.5,9.2,7.6, 4.3, 6.2, 4,1.9)
V16 <- c(39.2, 25,21.8, 23.2, 13.3, 9.8, 11.8, 5)
age <- data.frame(V8, V13, V14, V16)
sca <- plot_ly(age, x = ~V8, y = ~V13, type = 'scatter', name = 'Both', mode = 'makers', marker = list(opacity = 1))
fig <- fig %>% add_trace(y = ~V14, name = 'Female')
fig <- fig %>% add_trace(y = ~V16, name = 'Male')
fig <- fig %>% layout(xaxis = list(showgrid = FALSE), yaxis = list(title = "Rate"), title = "Suicide rate By Age", barmode = 'group')
fig
