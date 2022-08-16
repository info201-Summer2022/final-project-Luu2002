library(shiny)

# Define UI
# Navigation Tabs including(titles of the web and sections)
ui <- fluidPage(
  navbarPage('Suicide Rate in the World',
    tabPanel('Overview'),
    tabPanel('Suicide Rate by Age'),
    tabPanel('Suicide Rate by Gender'),
    tabPanel("Suicide Death Rate"),
    tabPanel('Summary')
    
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)