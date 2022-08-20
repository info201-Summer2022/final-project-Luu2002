library(dplyr)
library(hrbrthemes)
library(plotly)
library(tidyverse)

# Define Server 
# Creating 4 Charts(Pie,  Two Scatter, and Bar)
server <- function(input, output){
  output$selected_var <- renderText({
    paste("You have selected", input$gender_country)
  })
  
  output$selected_var_2 <- renderText({
    paste("You have selected", input$death_country)
  })
  
############### Scatter Plot for Gender Dataset ###############
  
  # Summarize gender data and creating 2 scatter plot
  gender_data <- reactive({
    req(input$gender_country)
    df <- gender_df %>%
      filter(Entity %in% input$gender_country) %>%
      group_by(Year) 
  })
  
  # Male Scatter Plot in Different Countries
  output$male_plot <- renderPlotly({
    p <- ggplot(gender_data(), aes(y = Male_suicide_rate, x = Year)) +
      geom_point(size = 4, color="#1072BE") + 
      ggtitle("Male Suicide Rate from 1990 to 2017") +
      theme(plot.title = element_text(hjust = 0.5))
    theme_bw()
    
    ggplotly(p)
  })
  
  # Female Scatter Plot in Different Countries
  output$female_plot<- renderPlotly({
    g <- ggplot(gender_data(), aes(y = Female_suicide_rate, x = Year)) +
      geom_point(size = 4, color="#F229D8") + 
      ggtitle("Female Suicide Rate from 1990 to 2017") +
      theme(plot.title = element_text(hjust = 0.5))
    theme_bw()
    
    ggplotly(g)
  })
  
############### Bar Chart for Death Rate Dataset ###############
  
  # Summarize death data and creating a bar chart
  death_data <- reactive({
    req(input$death_country)
    df <- countries %>%
      filter(Entity %in% input$death_country) %>%
      group_by(Year) 
    
  })
  
  # Bar Chart for Death Rate across the World
  output$countryPlot <- renderPlotly({
    f <- ggplot(death_data(), aes(x = Year, y = Death_Rate_Percentage)) + 
      geom_bar(stat = "identity", color="blue", fill=rgb(0.1,0.4,0.5,0.7)) +
      ggtitle("Suicide Death Rate in Different Country from 1990 to 2019") +
      theme(plot.title = element_text(hjust = 0.5))
    
    ggplotly(f)
  })

############### Pie Chart for Age Dataset ###############
  
  # Pie Chart for Suicide Rate by Age
  output$distPlot <- renderPlotly({
    
    colm_1 = input$var_1
    colm_2 = input$var_2
    
    # Clean data and create chart
    age_df %>%
      filter(Entity == colm_1, Year == colm_2) %>%
      mutate(Percentage = value/sum(value)*100,
             Pos = cumsum(Percentage) - 0.5*Percentage) %>%
      plot_ly(values = ~value, labels = ~factor(Group), type = "pie", 
              title = paste0(colm_1, " ", "Suicide Rate by Age Group in", " ", colm_2))
  })
  
  # Clean chart and make table
  output$table <- renderTable({
    
    colm_1 = input$var_1
    colm_2 = input$var_2
    
    age_df %>%
      filter(Entity == colm_1, Year == colm_2) %>%
      mutate(Percentage = value/sum(value)*100,
             Pos = cumsum(Percentage) - 0.5*Percentage) %>%
      arrange(Group) %>%
      select(Group, Percentage)
  })

############### Upload Image for Overview and Summary Page ###############
  
  # Image for Overview Page 
  output$myImage <- renderImage({
    list(src = "Suicide.png",
         align = "center",
         width = "100%",
         height = 500)
    
  }, deleteFile = F)
  
  # Scatter Plot Image for Summary Page
  output$maleplot <- renderImage({
    list(src = "male_plot.png",
         align = "center",
         width = "100%",
         height = 480)
    
  }, deleteFile = F)
  
  # Scatter Plot Image for Summary Page
  output$femaleplot <- renderImage({
    list(src = "female_plot.png",
         align = "center",
         width = "100%",
         height = 480)
    
  }, deleteFile = F)
  
  # Bar Plot Image for Summary Page
  output$deathplot <- renderImage({
    list(src = "China.png",
         align = "center",
         width = "100%",
         height = 480)
    
  }, deleteFile = F)
  
  # Pie Chart Image for Summary Page
  output$ageplot <- renderImage({
    list(src = "Iceland.png",
         align = "center",
         width = "70%",
         height = 400)
    
  }, deleteFile = F)
}


# Make the App
shinyApp(ui = ui, server = server)