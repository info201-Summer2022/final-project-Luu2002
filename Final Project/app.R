#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    
    HTML(r"(
         
         <h1>Overview</h1>
         <h3> Why we choose Suicide?</h3>
         <p">Suicide is a major global public health problem. According to WHO (World Health Organization) estimates, an average of 1 million people worldwide die by suicide each year, and about 10-20 million people attempt suicide, making suicide one of the leading causes of death worldwide. Mental illness and socioeconomic factors have been shown to be the most closely related to suicide, and the effect of mental factors on suicide rates varies significantly with their socioeconomic status in different developed countries, while the effect of mental factors on suicide rates is smaller in developing countries. In recent years, research on the relationship between suicide rates and socioeconomic status has gradually become a hot topic.
         </p>
         <h3>How was this study done?</h3>
         <p">Brainstorming is used to get final ideas when deciding on a research topic. The group members told each other what they found interesting and allowed each researcher to come up with his or her own ideas. We then discussed our ideas about suicide rates and decided what conclusions we would like to analyze and draw from this project. By thinking about each person's perspective on suicide we decided what problem we wanted to solve. After deciding on the detests, it was time to consider what kind of graphs could be used to effectively visualize the datasets. after all the preparatory questions were answered, we completed all the content by dividing it evenly.</p>
         <h3>Questions we want to solve</h3>
         <p">1)Which countries has the highest suicide rate in the world?</p>
         <p">2)Which gender will mostly likely to contain suicide?</p>
         <p">3)Did suicide rate decreased in the recent years?</p>
         <p">4)Which age group has the highest suicide rate？</p>
         <h3>Reference</h3>
         <p">1)Suicide-deaths-by-age.csv</p>
         <p">2)Share-deaths-suide.csv</p>
         <p">3)Male vs female suicide.csv</p>
         <p">https://ourworldindata.org/suicide</p>
    )"
    ),
    mainPanel(
      img(src='Suicide.png', align = "right"))
      )
       
    


# Define server logic required to draw a histogram
server <- function(input, output) {

    
}

# Run the application 
shinyApp(ui = ui, server = server)
