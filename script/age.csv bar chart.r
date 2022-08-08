library(plotly)

suicide_age_df <- read.csv("~/Desktop/age.csv") %>%
  select(Location, Period, Dim1, Dim2, Dim2ValueCode) %>%
  filter(Location %in% c("United States of America", "Japan", "Mexico, philippines", "Korea", "Poland", "Singapore", "Qatar"))

Dim2 <- c(15,25,35,45,55,65,76,85)
suicide_age_df <- df(Location, Period, Dim1, Dim2, Dim2ValueCode)

fig <- plot_ly(age, x = ~Location, y = ~Dim1, type = "bar", name = "Both")
fig <- fig %>% add_trace(name = "Female")
fig <- fig %>% add_trace(name = "Male")
fig <- fig %>% layout(yaxis = list(title = "Age"), title = "Suicide rate By Age", barmode ="group")

fig