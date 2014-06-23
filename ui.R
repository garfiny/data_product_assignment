library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Miles Per Gallon"),
  
  sidebarPanel(
    selectInput("cylinders", "Cylinders:",
                choices = c("4", "6", "8")),
    br(),
    radioButtons("transmission", "Transmission:", 
                 list("Automatic" = "0",
                      "Manual" = "1")),
    sliderInput("mpg", "Miles per Gallon:",
                min = 10, max = 35, value=15, step = 0.1)
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel('Table', dataTableOutput('mytable')),
      tabPanel('Diagram', plotOutput('mydiagram'))
    )
  )
))