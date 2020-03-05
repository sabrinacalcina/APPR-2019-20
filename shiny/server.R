library(dygraphs)
library(shiny)

shinyServer(
  function(input, output) {
    output$aktivnost <- renderDygraph({ 
      aktivnost <- aktivnost %>% filter(spol == input$spol & 
                                          starostna_skupina == input$starostna_skupina & meritve == input$meritve)
      don <- xts(x=aktivnost$delovno_sposobni, order.by=as.yearqtr.default(aktivnost$leto), 
                 scale_x_continuous('Leto', breaks = seq(2008, 2018, 1), limits = c(2008,2018)))
                 dygraph(don) %>% dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, drawGrid = TRUE, colors="#2FFFFF	") %>%
      dyCrosshair(direction = "vertical") %>%
      dyHighlight(highlightCircleSize = 4, highlightSeriesBackgroundAlpha = 0.2, hideOnMouseOut = FALSE)  %>%
      dyRoller(rollPeriod = 1) %>%
      dySeries("V1", label = "Število") 
  })
    
  })
