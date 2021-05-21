# 06.desafio.3

library(shiny)
source("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/funciones/crear%20datos.r" )


ui <- fluidPage(
  textInput(inputId = "nombre", label = "Nombres:"),
  numericInput(inputId = "edad", label = "Edad:", min = 18, max = 65, step = 1, value = round(mean(18:65),0)),
  selectInput(inputId = "estado", label = "Estados", choices = c("Durango", "Nuevo León","Sinaloa", "Zacatecas" )),
  textOutput("saludos"),
  tableOutput("agregar")
)
server <- function(input, output, session) {
  output$saludos <- renderPrint({
    saludos <- paste("Hola", input$nombre, 
                     "tienes ", input$edad,"años",
                     "y eres del estado de: ", input$estado)
    saludos
  })
  
  output$agregar <- renderTable({
    #datos$nombres <- enc2native(datos$nombres)
    datos
    
  })
}
shinyApp(ui, server)