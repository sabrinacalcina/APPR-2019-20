library(dygraphs)
library(shiny)

shinyServer(
  function(input, output) {
  
    output$moja_aktivnost <- renderPlot({
      graf_aktivnost(input$spol, input$starostna_skupina, input$meritve)
  })
  
})