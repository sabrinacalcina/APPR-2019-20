library(dygraphs)
library(shiny)

shinyServer(
  function(input, output, session) {
    output$aktivnost <- renderDygraph({ 
      aktivnost <- aktivnost %>% filter(spol == input$spol & 
                                          starostna_skupina == input$starostna_skupina & meritve == input$meritve)  })
  
})

