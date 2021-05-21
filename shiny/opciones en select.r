# interactivas.r

library(shiny)

ui = fluidPage(
  selectInput("opciones", "opciones:",
              c("Uno" = "Uno",
                "Dos" = "Dos",
                "Tres" = "Tres")),
  verbatimTextOutput(outputId = "descripcion")
  
)

server = function(input, output) {
  output$descripcion <- renderPrint({
    opc <- input$opciones
    opc
  })
}
shinyApp(ui, server)