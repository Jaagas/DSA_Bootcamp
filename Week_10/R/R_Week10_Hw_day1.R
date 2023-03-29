# Load necessary libraries
library(shiny)      # For building Shiny apps
library(dplyr)      # For data manipulation
library(ggthemes)   # For theme customization in ggplot2
library(skimr)      # For summary statistics and visualization of data
library(naniar)     # For visualization of missing data
library(DT)         # For rendering interactive data tables
library(ggplot2)
library(ggcorrplot)
library(GGally)
library(corrplot)
# Define UI
ui <- fluidPage(
  
  # Set panel name
  titlePanel("Exploratory Data Analysis"),
  
  # Set theme
  theme = theme_fivethirtyeight(base_size = 16),
  
  # Display data
  mainPanel(
    h3("Data"),
    verbatimTextOutput("dataOutput")
  ),
  
  # Display skim output
  sidebarPanel(
    selectInput("type", "Which type of variable?", c("is.numeric", "is.character")), # User input for variable type
    h3("Skim Output"),
    verbatimTextOutput("skimOutput")
  ),
  
  # Display missing values plot
  mainPanel(
    h3("Missing Values Plot"),
    plotOutput("naPlot")
  ),
  
  # Display correlation plot
  mainPanel(
    h3("Correlation Plot"),
    plotOutput("corPlot")
  ),
  
  # Display grouped data table
  mainPanel(
    h3("Grouped Data"),
    numericInput("n", "Number of samples:", 2, min = 1, max = 500), # User input for number of samples
    dataTableOutput("groupedData")
  )
)

# Define server
server <- function(input, output) {
  
  # Import data
  future500 <- read.csv("Future-500 (1).csv")  # Import data from CSV file
  
  # Display data
  output$dataOutput <- renderPrint({
    glimpse(future500)  # Print data to main panel
  })
  # Display skim output
  output$skimOutput <- renderPrint({
    if(input$type == "is.numeric") {
      skim(future500 %>% select_if(is.numeric))
    } else if(input$type == "is.character") {
      skim(future500 %>% select_if(is.character))
    }
  })
  
  # User input for variable type
  selectInput("type", "Which type of variable?", c("is.numeric", "is.character"))
  
  
  
  # Display missing values plot
  output$naPlot <- renderPlot({
    gg_miss_var(future500)  # Plot missing data using ggplot2
  })
  
  # Display correlation plot
  output$corPlot <- renderPlot({
    future500_numeric <- future500 %>% select_if(is.numeric)
    corr <- cor(future500_numeric, use = "pairwise.complete.obs")
    corrplot(corr, method = "color", type = "upper", order = "hclust", 
             tl.col = "black", tl.srt = 45)
  })
  
  # Display grouped data table
  output$groupedData <- renderDataTable({
    n <- input$n  # Get number of samples from user input
    groupedData <- future500 %>%
      group_by(Industry, Inception) %>%
      summarise(total_profit = sum(Profit)) %>%
      arrange(desc(total_profit)) %>%
      head(n)  # Group data by Industry and Inception variables, summarize total profit, sort by total profit in descending order, and display desired number of samples in interactive data table
    groupedData
  })
}

# Run app
shinyApp(ui, server)
