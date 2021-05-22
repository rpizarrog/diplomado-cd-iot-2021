# Regresión lineal 
# Cargar archivo y presentar regresión lineal simple
library(shiny)
library(readr)
library(ggplot2)

#source("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/scripts/cargar%20datos%20pizzas%20ventas%20aerolineas%20women.r")

ui <- fluidPage(
  titlePanel("Regresión Lineal Simple"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "archivo", label = "Archivos del directorio datos", 
                  choices = c(dir(path = "../datos", pattern = "*.csv",full.names = TRUE))),
      verbatimTextOutput(outputId = "observaciones"),
      verbatimTextOutput(outputId = "descripcion"),
      tableOutput(outputId = "tabla")
    ),
    mainPanel(
      verbatimTextOutput(outputId = "modelo"),
      plotOutput("dispersion")
    )
  )
)

server <- function(input, output, session) {
  datos <- reactive ({
    archivo <- input$archivo 
    archivo
    dt <- read.csv(archivo)
    dt <- dt[,c(ncol(dt)-1,ncol(dt)) ]
    dt
  })
  modelo <- reactive({
    lm(data = datos(), formula = datos()[,2] ~ datos()[,1] )
  })
  output$observaciones <- renderPrint({
    paste("Total de Observaciones", nrow(datos()))
  })
  output$descripcion <- renderPrint({
        summary (datos()[,1:2])
  })
  
  output$tabla <- renderTable({

    datos()
  })
  output$modelo <- renderPrint({
    summary(modelo())
  })
  
  output$dispersion <- renderPlot({
    y_predict <- predict(modelo(), datos())
    ggplot() + geom_point(data = datos(), aes(x = datos()[,1], y = datos()[,2]), size = 0.9) +
      geom_line(aes( x = datos()[,1], y = y_predict), color = "red") +
      xlab(colnames(datos()[1])) + 
      ylab(colnames(datos()[2])) + 
      ggtitle("Linea de tendencia sobre Conjunto de Datos", 
              subtitle = paste("Y = ",modelo()$coefficients[1],
                               "+",
                               modelo()$coefficients[2],"*",
                               colnames(datos()[1])))
  })
  
}
shinyApp(ui, server)