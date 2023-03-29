
library(tidyverse)
library(data.table)
library(inspectdf)
library(shiny)

# The data ----
injuries <- fread("injuries.csv")
products <- fread("products.csv")
population <- fread("population.csv")

# EDA ----
injuries %>% inspect_na()
products %>% inspect_na()
population %>% inspect_na()

# Look at the product associated with the most injuries
injuries$prod_code %>% 
  as.factor() %>% 
  table() %>% 
  as.data.frame() %>% 
  arrange(desc(Freq)) %>% 
  .[1,1] -> pc

products$title[products$prod_code == pc]

stair_step <- injuries %>% filter(prod_code == 1842)


# App de olacaq 4 dene analiz ----

#1 ci analiz
stair_step %>% count(diag, sort = T) 

#2 ci analiz
stair_step %>% count(body_part, sort = T) 

#3 cu analiz
stair_step %>% count(location, sort = T) 

#4 cu analiz
stair_step %>% 
  count(age, sex) %>% 
  merge(population, by = c("age", "sex"), all.x = T) %>% 
  mutate(rate = n / population * 10000) %>% 
  ggplot(aes(age, rate, colour = sex)) + 
  geom_line() + 
  labs(y = "Injuries per 10,000 people")



# UI ----
ui <- fluidPage(
  
  titlePanel("Consumer Product Safety Commission"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("product", "Select a product:",
                  choices = products$title, selected = "Bicycles"),
      sliderInput("age_range", "Select age range:",
                  min = 0, max = 100, value = c(0, 100), step = 5),
      checkboxInput("male", "Include males", TRUE),
      checkboxInput("female", "Include females", TRUE),
      checkboxInput("unknown_gender", "Include unknown gender", FALSE),
      hr(),
      helpText("Data source: National Electronic Injury Surveillance System.")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Table", tableOutput("table")),
        tabPanel("Body Part", plotOutput("body_part_plot")),
        tabPanel("Location", plotOutput("location_plot")),
        tabPanel("Age and Sex", plotOutput("age_sex_plot"))
      )
    )
  )
)


# Server ----
server <- function(input, output) {
  
  # Filter injuries data based on selected product and age range
  filtered_injuries <- reactive({
    injuries %>%
      inner_join(products %>% select(prod_code, title), by = "prod_code") %>%
      filter(title == input$product,
             age >= input$age_range[1], age <= input$age_range[2])
  })
  
  # Generate data for table
  output$table <- renderTable({
    filtered_injuries() %>%
      select(trmt_date, sex, age, race, body_part, diag, location, narrative)
  })
  
  # Generate plot of body part distribution
  output$body_part_plot <- renderPlot({
    filtered_injuries() %>%
      count(body_part, sort = TRUE) %>%
      ggplot(aes(x = reorder(body_part, n), y = n)) +
      geom_col(fill = "steelblue") +
      coord_flip() +
      labs(title = "Distribution of injuries by body part")
  })
  
  # Generate plot of location distribution
  output$location_plot <- renderPlot({
    filtered_injuries() %>%
      count(location, sort = TRUE) %>%
      ggplot(aes(x = reorder(location, n), y = n)) +
      geom_col(fill = "steelblue") +
      coord_flip() +
      labs(title = "Distribution of injuries by location")
  })
  
  # Generate plot of injury rates by age and sex
  output$age_sex_plot <- renderPlot({
    filtered_injuries() %>%
      count(age, sex) %>%
      left_join(population, by = c("age", "sex")) %>%
      mutate(rate = n / population * 10000) %>%
      filter((sex == "Male" & input$male) |
               (sex == "Female" & input$female) |
               (is.na(sex) & input$unknown_gender)) %>%
      ggplot(aes(x = age, y = rate, color = sex)) +
      geom_line() +
      labs(title = "Injury rates by age and sex",
           x = "Age", y = "Injury rate per 10,000 people")
  })
  
}

# Run the app
shinyApp(ui, server)
