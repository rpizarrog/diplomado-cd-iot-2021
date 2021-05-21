# 02.desafio.r
library(shiny)
ui <- fluidPage(
  selectInput(inputId = "Archivos", 
              label = "Archivos", 
              choices = dir(path = "../datos", pattern = "*.csv"))
  
)
server <- function(input, output, session) {
}
shinyApp(ui, server)