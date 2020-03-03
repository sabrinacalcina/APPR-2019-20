library(dygraphs)
library(shiny)

shinyServer(
  function(input, output) {
    output$aktivnost <- renderDygraph({ 
      aktivnost <- aktivnost %>% filter(spol == input$spol & 
                                          starostna_skupina == input$starostna_skupina & meritve == input$meritve)
    don <- xts(x=aktivnost$leto, order.by=as.yearqtr.default(aktivnost$delovno_sposobni))
    dygraph(don) %>% dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, drawGrid = FALSE, colors="#f09ce0") %>%
      dyCrosshair(direction = "vertical") %>%
      dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2, hideOnMouseOut = FALSE)  %>%
      dyRoller(rollPeriod = 1) %>%
      dySeries("V1", label = "Število")
    
  })
    
  })
