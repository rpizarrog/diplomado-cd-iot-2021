# 03.desafio.r
library(shiny)
library(readr)

ui <- fluidPage(
  selectInput(inputId = "archivo", label = "Archivos del directorio datos", 
              choices = c(dir(path = "../datos", pattern = "*.csv",full.names = TRUE))),
  verbatimTextOutput(outputId = "descripcion"),
  tableOutput(outputId = "tabla")
)
server <- function(input, output, session) {
  output$descripcion <- renderPrint({
    archivo <- input$archivo 
    archivo
    datos <- read.csv(archivo)
    summary (datos)
    
  })
  
  output$tabla <- renderTable({
    archivo <- input$archivo
    archivo
    datos <- read.csv(archivo)
    datos
  })
}
shinyApp(ui, server)