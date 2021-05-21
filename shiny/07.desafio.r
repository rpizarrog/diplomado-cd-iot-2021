# 07.desafio.r
library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "minimo", 
              label = "Valor mínimo", 
              min = 0, max = 100,  step = 10, value = 30),
  sliderInput(inputId = "maximo", 
            label = "Valor mínimo", 
            min = 0, max = 100,  step = 20, value = 80),
  numericInput(inputId = "n", label = "Cantidad de números", 
               value = 50, min = 10, max = 100, step = 10),
  textOutput(outputId = "numerosTxt"),
  tableOutput (outputId = "numerosTab")  
  )

server <- function(input, output, session) {
    datos <- reactive({
      datos <-sample(x = input$minimo:input$maximo, 
                                size = input$n, 
                                replace = TRUE)
    }
      
    )
    output$numerosTxt <- renderText(
    #datos <- as.vector(sample(x = input$minimo:input$maximo, 
    #                          size = input$n, 
    #                          replace = TRUE))
      datos()
    )
    output$numerosTab <- renderTable(
      #datos <- as.vector(sample(x = input$minimo:input$maximo, 
      #                          size = input$n, 
      #                          replace = TRUE))
      datos()
    )
  }
shinyApp(ui, server)