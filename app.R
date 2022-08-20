library(shiny)
library(hrbrthemes)
library(plotly)
library(tidyverse)
library(shinyWidgets)
library(shinythemes)

# Load Data
gender_df <- read.csv('gender_rate.csv')
countries <- read.csv("death_rate.csv")
df <- read_csv("age_rate.csv")

# Fix age data
age_df <- df %>%
pivot_longer(-c("Entity", "Code", "Year"), names_to = "Group") %>%
  mutate_at("Group", ~str_match(., "Age: (.*?) years")[, 2]) %>%
  mutate_at("Group", ~factor(., levels = c("5-14", "15-49", "50-69", "70+")))


# Gender Tab
gender_Page <- fluidPage(theme = shinytheme("sandstone"),
                         tags$style('body {background-color: #FFFAF0;}'),
  HTML("<h3>Control Panel</h3>"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "gender_country", 
                  label = "Select the Country:", 
                  choices = gender_df$Entity, 
                  selected = " "),
      
      textOutput("selected_var"),
    ),
    
    mainPanel(
      h3("Q: What does the difference in suicide rates between male and female tell you?"),
      br(),
      br(),
      plotlyOutput(outputId = "male_plot"),
      br(),
      br(),
      plotlyOutput(outputId = "female_plot"),
      HTML(r"(
           <hr style="border:2px solid;">
           <h2 style = "color: black;">Description</h2>)"),
      p("With the help of this plot, we can identify any trends in the suicide rates by gender in various country throughout the world. 
        We will be able to see how the suicide rates for male and female vary depending on the country and the year.", 
        style = "font-family: 'times'; font-size: 15pt")
    )
  )
)

# Death Page
death_Page <- fluidPage(
  HTML("<h3>Control Panel</h3>"),
  sidebarLayout(
    sidebarPanel(
      selectInput("death_country",
                  "Select the Country:",
                  paste(countries$Entity), 
                  selected = " "),
      
      textOutput("selected_var_2"),
    ),

    mainPanel(
      h3("Q: How has the suicide rate in various countries changed over the year?"),
      br(),
      br(),
      plotlyOutput(outputId = "countryPlot"),
      HTML(r"(
           <hr style="border:2px solid;">
           <h2 style = "color: black;">Description</h2>)"),
      p("This graph helps us to identify any patterns in the suicide death rate in various countries around the world from 1990 to 2019. 
        In which we will be able to see how the suicide death rate has evolved through time.",
        style = "font-family: 'times'; font-size: 15pt")
    )
  )
)

# Age Page
age_Page <- fluidPage(
  HTML("<h3>Control Panel</h3>"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
      "var_1",
      label = "Select the Country:",
      choices = c(names(table(age_df$Entity))),
      selected = "Afghanistan"
    ),
    
    selectInput(
      "var_2",
      label = "Select the Year",
      choices = c(names(table(age_df$Year))),
      selected = "1900")
  ),
  
    mainPanel (
      tableOutput("table"),
      plotlyOutput(outputId = "distPlot"),
      HTML(r"(
           <hr style="border:2px solid;">
           <h2 style = "color: black;">Description</h2>)"),
      p("Pie chart allow us to investigate the suicide rate of people in different age groups, 
         which can analyze which age group is prone to mental stress. 
         Therefore, it can play a protective role before this age group comes.", 
        style = "font-family: 'times'; font-size: 15pt")
    )
  )
)
  
# Overview Page
overview_page <- fluidPage(
  HTML(r"(
       <h1 style = "color: black;"> Suicide Rate in the World </h1>
       <br>)"
  ),
  
  mainPanel(
    tags$div(
      style="margin-bottom:130px;",
      imageOutput("myImage")),
    HTML(r"(
         <h3 style = "color: #5DADE2;">Why analyzing suicide rate? </h3>
         <p style = "font-size:120%; ">Suicide is a serious global public health issue, according to World Health Organization (WHO) statistics. 
         Every year, an estimated 1 million people worldwide commit suicide, while another 10-20 million attempt suicide, 
         making suicide one of the top causes of death globally. Mental illness and socioeconomic factors have been shown to be the most closely related to suicide, 
         and the effect of mental factors on suicide rates varies significantly with socioeconomic status in different developed countries, 
         while the effect of mental factors on suicide rates is smaller in developing countries. 
         In recent years, research on the association between suicide rates and socioeconomic position has progressively gained traction.</p>
        
        <h3 style = "color: #1A5276 ;">How was this study done?</h3>
        <p style = "font-size:120%; "> When deciding on a study topic, brainstorming is utilized to generate final ideas. 
        Members of the group discussed what they found interesting and enabled each individual to come up with his or her own ideas. 
        We next reviewed our thoughts on suicide rates and chose what implications we wanted to make from this study. 
        We selected what problem we wanted to tackle by considering each person's opinion on suicide. 
        Following the selection of detests, it was time to explore what types of graphs may be utilized to best show the datasets.
        We completed all of the content by splitting it evenly after answering all of the preparation questions.</p>
        
        <h3 style = "color: #1ABC9C;">How was the analysis done?</h3>
        <p style = "font-size:120%; "> We established three leading questions for each topic and responded with various types of visualizations. 
        The next few sections provide visualizations and insights into how suicide rates have evolved over time in various countries throughout the world. 
        Following questions could be answered by the visualizations.
        </p>
        <p style = "font-size:120%; ">1. What does the difference in suicide rates between gender demonstrate?</p>
        <p style = "font-size:120%; ">2. How has the suicide rate in various countries changed over the year?</p>
        <p style = "font-size:120%; ">3. Which age group has the greatest suicide rate overall?</p>

        <h3 style = "color: #117864;">Source</h3>
        <p style = "font-size:110%; ">1. Share of deaths from suicide</p>
        <p style = "font-size:110%; ">2. Deaths from suicide, by age</p>
        <p style = "font-size:110%; ">3. Male vs. female suicide rate</p>
        )"
    ),
    tags$a(href="https://ourworldindata.org/suicide#citation", 
         "Our World in Data"),
    br(),
    tags$a(href="https://media.npr.org/assets/img/2014/05/19/suicide-task-force_wide-88cba52e2caeb8ea3eeb36d7821a1954248de319-s1600-c85.webp",
         "Cover Image"),
  
    tags$style("p{color: black;}"),
    p("Professional Team Members: Luluu Chen, Zijie Liao and Sabrina Wang")
  )
)

# Summary Page
summary_Page <- fluidPage(
  HTML(r"(
       <h1 style = "color: black;"> Summary </h1>
       <h2 style = "color: #A569BD;"> Q: What does the difference in suicide rates between gender demonstrate? </h2>
       <p style = "font-size:130%;"> A notable tendency we saw was that, across all genders in the years, 
       males had the greatest suicide rate in most nations throughout the world when compared to females. 
       Another noteworthy pattern is that, according to the chart below in the United States suicide rate by gender from 1990 to 2017, 
       both genders started high as the year went on, but it began to decrease after 1993, 
       but it surged after 2000. We believe that by examining this data, more people would recognize that suicide is a worldwide problem, 
       not only in the United States. 
       </p> 
       <P style = "font-size:100%;"> Chart: Suicide rate by gender in the United States </p>
       )"
  ),
  
  # Gender Plot
  mainPanel(
    imageOutput(outputId = "maleplot"),
    br(), 
    br(),
    br(),
    br(),
    br(),
    imageOutput("femaleplot"),
    br(), 
    br(), 
    br(),
    br(),
    br(),
    HTML(r"(
         <h2 style = "color: #2ECC71  ;"> Q: How has the suicide rate in various countries changed over the year? </h2>
         <p style = "font-size:130%;"> The chart below depicts the suicide mortality rate in China from 1990 to 2019. 
         As shown, the trend has been dropping over the past year. 
         This is actually a very excellent indicator. According to the chart, the suicide rate in 1995 was 2.63%, 
         which was somewhat higher than the previous year. In the most recent year of 2019, the suicide rate was at its lowest, at 1.14%. As a result, 
         we can see from the chart that China's suicide rate has been falling, despite the fact that it began high.
         </p> 
         <P style = "font-size:100%;"> Chart: Suicide death rate in the China </p>
         )"
    ),
    
    # Death Rate Chart
    br(), 
    imageOutput(outputId = "deathplot"),
    br(), 
    br(), 
    br(),
    br(),
    br(),
    HTML(r"(
         <h2 style = "color: #F0B27A;"> Q: Which age group has the greatest suicide rate overall? </h2>
         <p style = "font-size:130%;"> A pie chart with several age groups ranging from 5 to 70+ years old is shown below. 
         According to data from several nations, the suicide rate in the 15-49 age range is quite high, regardless of country. 
         In comparison to other age groups, the suicide rate among children aged 5 to 14 is relatively low. 
         Suicide rates may be increasing with age due to psychological issues and social stress connected with changing social responsibilities. 
         As a result, individuals between the ages of 15 and 49 are more likely to commit suicide for a variety of reasons, 
         including school, work, depression, and many others.
         </p> 
         <P style = "font-size:100%;"> Chart: Suicide rate by age group in the Iceland</p>
         )"
      ),
      br(), 
      imageOutput(outputId = "ageplot"),
  )
)


# Define UI
# Navigation Tabs including(titles of the web and sections)
ui <- navbarPage('Suicide Rate in the World',
                   
    tabPanel('Overview', overview_page),
    tabPanel('Suicide Rate by Age', age_Page),
    tabPanel('Suicide Rate by Gender', gender_Page),
    tabPanel("Suicide Death Rate", death_Page),
    tabPanel('Summary', summary_Page)
)


# Define Server 
# Creating 4 Charts(Pie, Scatter, and Bar)
server <- function(input, output){
  output$selected_var <- renderText({
    paste("You have selected", input$gender_country)
  })
  
  output$selected_var_2 <- renderText({
    paste("You have selected", input$death_country)
  })
  
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
      
  # Overview Page 
  output$myImage <- renderImage({
    list(src = "Suicide.png",
        align = "center",
        width = "100%",
        height = 500)
        
    }, deleteFile = F)
  
  # Summary Page
  output$maleplot <- renderImage({
    list(src = "male_plot.png",
         align = "center",
         width = "100%",
         height = 480)
    
  }, deleteFile = F)
  
  output$femaleplot <- renderImage({
    list(src = "female_plot.png",
         align = "center",
         width = "100%",
         height = 480)
    
  }, deleteFile = F)
  
  output$deathplot <- renderImage({
    list(src = "China.png",
         align = "center",
         width = "100%",
         height = 480)
    
  }, deleteFile = F)
  
  output$ageplot <- renderImage({
    list(src = "Iceland.png",
         align = "center",
         width = "70%",
         height = 400)
    
  }, deleteFile = F)
}

# Make app
shinyApp(ui = ui, server = server)