# Agregando controles.r

library(shiny)
ui <- fluidPage(
  selectInput(inputId = "dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput(outputId = "summary"),
  tableOutput(outputId = "table")
)


server <- function(input, output, session) {
  datos <- reactive({
      get(input$dataset)
  })
  output$summary <- renderPrint({
       summary(datos())
   
  })
  
  output$table <- renderTable({
    datos()
  })
  
}
shinyApp(ui, server)