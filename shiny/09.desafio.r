# 09.desafio.r
# Entradas numéricas, muestra de números y plot

library(shiny)
ui <- fluidPage( 
  numericInput("num1", "Número 1 y tamaño de la muestra", value = 50, min = 1, max = 500, step = 20 ),
  sliderInput("num2", "Número 2 semilla de los valores aleatorios", value = 50, min = 1, max = 100),
  sliderInput("rango", "Rango de valores de la muestra", value = c(10, 20), min = 1, max = 100),
  textOutput("numeros"),
  plotOutput("grafica")
  

) 




server <- function(input, output, session) {
  datos <- reactive({
    set.seed(input$num2)
    sample(x = min(input$rango):max(input$rango), 
          size = input$num1, 
          replace = TRUE )
    
  })  
  
  output$numeros <- renderText({
    datos()
  })
  
  output$grafica <- renderPlot({
    par(mfrow=c(1,3))
    plot(datos(), type='b')
    hist(datos())
    hist(datos(), freq = FALSE)
    lines(density(datos(), col = "red"))
    par(mfrow=c(1,1))
  
  })
  
}
shinyApp(ui, server)