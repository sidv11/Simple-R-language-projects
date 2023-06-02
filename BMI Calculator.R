library(shiny)

ui <- fluidPage(
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("weight", "Weight (in kg):", value = 0),
      numericInput("height", "Height (in cm):", value = 0),
      
      actionButton("calculate", "Calculate BMI", class = "btn-primary")
    ),
    
    mainPanel(
      h3("Your BMI:"),
      verbatimTextOutput("bmiResult")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$calculate, {
    weight_kg <- input$weight
    height_cm <- input$height
    
    height_m <- height_cm / 100
    bmi <- weight_kg / (height_m ^ 2)
    
    output$bmiResult <- renderPrint({
      paste("BMI:", round(bmi, 2))
    })
  })
}

shinyApp(ui, server)
