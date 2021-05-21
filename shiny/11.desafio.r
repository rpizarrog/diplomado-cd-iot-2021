# 11.desafio.r
library(shiny)
source("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/funciones/crear%20datos.r" )

ui <- fluidPage(
  tableOutput("fijo"),
  dataTableOutput("dinamico")
)
server <- function(input, output, session) {
  output$fijo <- renderTable(head(datos, 10))
  output$dinamico <- renderDataTable(datos, option = list(pageLength = 5))
}
shinyApp(ui, server)