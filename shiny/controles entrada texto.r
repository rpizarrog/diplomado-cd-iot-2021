# Controles de entrada texto

library(shiny)
ui <- fluidPage(
 textInput(inputId = "nombre", label = "Nombres:"),
 numericInput(inputId = "edad", label = "Edad:", min = 18, max = 65, step = 1, value = round(mean(18:65),0)),
 textOutput("saludos")
)
server <- function(input, output, session) {
  output$saludos <- renderPrint({
    saludos <- paste("Hola", input$nombre, "tienes ", input$edad,"años" )
    saludos
  })
}
shinyApp(ui, server)