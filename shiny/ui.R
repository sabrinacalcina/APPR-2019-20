library(shiny)

shinyUI(fluidPage(
    titlePanel("Delovno sposobni glede na aktivnost in mere aktivnosti po starostnih skupinah in spolu za celotno Slovenijo"),

  
  sidebarPanel(
    selectInput('spol','Spol',
                c('Moški','Ženski')),
    selectInput('starostna_skupina','Starostna skupina',
                levels(as.factor(aktivnost$starostna_skupina))),
    br(),
    selectInput('meritve','Meritve',
                levels(as.factor(aktivnost$meritve))),
    br()
  ),
  
  mainPanel(
    plotOutput('aktivnost')
  )
  
))
