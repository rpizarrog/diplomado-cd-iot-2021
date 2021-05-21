# 11.desafio.r
library(shiny)
library(ggplot2)

source("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/funciones/crear%20datos.r" )
datos$estados <- as.factor(datos$estados)
frecuencia <- table(datos$estados)

# Posible código
#if (input$con == "plot()") {
#  output$con.plot <- renderPlot(
#    barplot(height = frecuencia, names.arg = levels(datos$estados))
#  )      
#} else {
#  output$con.plot <- renderPlot(
#    ggplot(data =  datos, mapping = aes(x = estados))+
#      geom_bar()
#  )
  
#}

ui <- fluidPage(
  radioButtons(inputId = "con", 
               label = "¿Con cual función? ", 
               choices = c("plot()", "ggplot()")
               ),
  plotOutput(outputId = "con.plot"),
  plotOutput(outputId = "con.ggplot")
)
server <- function(input, output, session) {
    output$con.plot <- renderPlot(
          barplot(height = frecuencia, names.arg = levels(datos$estados))
          )
    output$con.plot <- renderPlot(
          ggplot(data =  datos, mapping = aes(x = estados))+
            geom_bar()
        )
    
}
shinyApp(ui, server)