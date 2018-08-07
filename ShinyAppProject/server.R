## Server file to process the inputs selected by the user

library(shiny)

#create the layout using the palette
palette(c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00","#FFFF33"))

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  inputIRIS <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(inputIRIS(), input$clusters)
  })
  
  output$plotIRIS <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(inputIRIS(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 3, cex = 4, lwd = 2)
  })
  
  
  output$summary <- renderPrint({
    dataset <- clusters()
    dataset
  })
})