# 08.desafio.r
# Controles de teto libre
library(shiny)
ui <- fluidPage( 
  textInput(inputId = "nombre", "Cual es tu nombre? "), 
	passwordInput(inputId = "contras", "Proporciona Contraseña"), 
	textAreaInput(inputId = "acerca", "Describe acerca de tu persona", 
	              rows = 5, value = "Lo que sea es algo personal "), 
  textOutput(outputId = "texto"),
  tableOutput(outputId = "tabla")
) 


server <- function(input, output, session) {
  datos <- reactive ({
    nombre <- input$nombre
    acerca <- input$acerca
    data.frame(nombre = nombre, acerca = acerca)
  }) 
  
  output$texto <- renderPrint({
    datos()
  })
  
  output$tabla <- renderTable({
    datos()
  })
  
}
shinyApp(ui, server)