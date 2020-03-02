source("lib/libraries.r", encoding="UTF-8")

#Regresijska premica za stevilo smrti brezposelnosti v Sloveniji


prileganje <- lm(data = slovenija, brezposelnost ~ leto)

l <- data.frame(leto=seq(2017, 2021, 1))
napoved <- mutate(l, brezposelnost=predict(prileganje, l))


graf_regresija <- ggplot(slovenija, aes(x=leto, y=brezposelnost)) + geom_point() + 
  geom_smooth(method='lm', formula=y ~ poly(x,2,raw=TRUE), fullrange=TRUE, color='green') +
  scale_x_continuous('Leto', breaks = seq(2008, 2020, 1), limits = c(2008,2020))


#shiny

graf_aktivnost <- function(spol,starostna_skupina, meritve){
  if(spol=='moski'){
    aktivnost <- aktivnost %>% filter(spol=='moski' &
                                       Starost==starostna_skupina & Meritev==meritev)
  }
  if(spol=='zenski'){
    aktivnost <- aktivnost %>% filter(spol=='zenski' &
                                      Starost==starostna_skupina & Meritev==meritev)
  }
  don <- xts(x=aktivnost$leto, order.by=as.yearqtr.default(aktivnost$delovno_sposobni))
  dygraph(don) %>%
    dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, 
              drawGrid = FALSE, colors="#f09ce0") %>%
    dyCrosshair(direction = "vertical") %>%
    dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2, 
                hideOnMouseOut = FALSE)  %>%
    dyRoller(rollPeriod = 1) %>%
    dySeries("V1", label = "Število")
  
}




