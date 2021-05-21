# limite_central.r
# Teorema de Límite Central
ui <- fluidPage(
  titlePanel("Teorema de Límite Central"),
  sidebarLayout(
    sidebarPanel(
      numericInput("m", "Number of muestras:", 2, min = 1, max = 100)
    ),
    mainPanel(
      plotOutput("hist")
    )
  )
)
server <- function(input, output, session) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(rnorm(input$m)))
    hist(means, breaks = 20)
  }, res = 96)
}
shinyApp(ui, server)
