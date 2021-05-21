# Probando select y radiobutton
library(shiny)

# Los datos
colores <- c("Rojo", "Azul", "Amarillo", "Verde", "Otro", "Otro") 

ui <- fluidPage( 
	checkboxGroupInput(inputId = "colores", label = "Colores favoritos", choices = colores)
) 

server <- function(input, output, session) {
}
shinyApp(ui, server)