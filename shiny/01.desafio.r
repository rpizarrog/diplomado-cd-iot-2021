# 01.desafio.r

library(shiny)
ui <- fluidPage(
  "Hola saludos me llamo Rubén Pizarro Gurrola. Estamos estudiando R Shiny para desarrollar aplicaciones interactivas con análisis de datos para posteriormente aplicarlo en modelos de Machine Learning"
)
server <- function(input, output, session) {
}
shinyApp(ui, server)