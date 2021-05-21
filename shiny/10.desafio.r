# 09.desafio.r
# Entradas numéricas, muestra de números y plot

library(shiny)
ui <- fluidPage(
  numericInput("n", "Cantidad de números", value = 50, min = 10, max = 500, step = 20),
  sliderInput("media", "La media de la distribución", value = 50, min = 0, max = 100, step = 10),
  sliderInput("desv", "Desviación stándar de la distribución", value = 20, min = 5, max = 30, step = 5),
  sliderInput("semilla", "Semilla para valores aleatorios de la distribución normal", value = 50, min = 1, max = 100, step = 10),
  textOutput("numeros"),
  plotOutput("grafica")
  

) 




server <- function(input, output, session) {
  datos <- reactive({
    set.seed(input$semilla)
    round(rnorm(n = input$n, mean = input$media, sd = input$desv),0)
    
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