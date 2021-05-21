# salidas tablas.r
library(shiny)
source("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/funciones/crear%20datos.r" )


ui <- fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic")
)
server <- function(input, output, session) {
  output$static <- renderTable(head(datos))
  output$dynamic <- renderDataTable(datos, options = list(pageLength = 5))
}
shinyApp(ui, server)