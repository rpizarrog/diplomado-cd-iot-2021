# Probando select y radiobutton
library(shiny)

# Los datos
animals <- c("Perro", "Gato", "Ratón", "Pájaro", "Otro", "No me gustan") 
colores <- c("Rojo", "Azul", "Amarillo", "Verde", "Otro", "Otro") 

ui <- fluidPage( 
	selectInput(inputId = "colores", 
	            label = "¿Color favorito?", 
	            choices = colores), 
  radioButtons(inputId = "animales", 
               label = "Animal favorito? ",
               choices = animals), 
	verbatimTextOutput(outputId = "salida")
	
) 

server <- function(input, output, session) {
  output$salida <- renderText({ 
    paste(input$animales, input$colores)
  })
  
}
shinyApp(ui, server)