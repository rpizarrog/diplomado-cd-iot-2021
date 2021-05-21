# 04.desafio.r
library(shiny)
ui <- fluidPage(
  selectInput(inputId = "frutas", label = "Selecciona frutas",
              choices = c("Naranja","Durazno", "Manzana", "Pera", "Limón", "Guayaba", "Melón", "Toronja", "")),
  verbatimTextOutput(outputId = "mostrar")  
)

server <- function(input, output, session) {
  output$mostrar <- renderPrint({
    fruta <- input$frutas
    if (fruta %in% c("Limon", "Toronja"))
      paste("La fruta seleccionada", fruta, " y es fruta agria")
    else 
      paste("La fruta seleccionada", fruta, " y es fruta dulce")
  })
  
  
    
}
shinyApp(ui, server)