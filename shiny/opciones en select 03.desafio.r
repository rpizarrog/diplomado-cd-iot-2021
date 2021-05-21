# interactivas.r

library(shiny)

ui = fluidPage(
  selectInput(inputId = "archivo", 
              label = "Archivos del directorio datos", 
              choices = c(dir())),
  verbatimTextOutput(outputId = "descripcion")
  
)

server = function(input, output) {
  output$descripcion <- renderPrint({
    opc <- input$archivo
    print(opc)
  })
}
shinyApp(ui, server)