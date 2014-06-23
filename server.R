library(shiny)
library(datasets)

shinyServer(function(input, output) {
  
  mycars <- reactive({
    mtcars[mtcars$cyl == input$cylinders & 
             mtcars$am == input$transmission &
             mtcars$mpg >= input$mpg, ]
  })

  output$mytable = renderDataTable({
    mycars()
  }, options = list(bSortClasses = TRUE))
  
  output$mydiagram = renderPlot({
    plot(hp ~ mpg, data = mycars(), type = 'p')
  })
})