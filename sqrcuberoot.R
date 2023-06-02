library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("Square Root and Cube Root Finder"),
  sidebarLayout(
    sidebarPanel(
      numericInput("number", "Enter a number:", value = NULL),
      actionButton("calculate", "Calculate"),
      actionButton("reset", "Reset")
    ),
    mainPanel(
      h3("Results"),
      verbatimTextOutput("sqrt_result"),
      verbatimTextOutput("cbrt_result")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Calculate square root and cube root when Calculate button is clicked
  observeEvent(input$calculate, {
    if (!is.null(input$number)) {
      sqrt_result <- sqrt(input$number)
      cbrt_result <- round(input$number^(1/3), 6)
      output$sqrt_result <- renderText(paste("Square root of", input$number, "is", sqrt_result))
      output$cbrt_result <- renderText(paste("Cube root of", input$number, "is", cbrt_result))
    }
  })
  
  # Reset input and results
  observeEvent(input$reset, {
    updateNumericInput(session, "number", value = NULL)
    output$sqrt_result <- renderText(NULL)
    output$cbrt_result <- renderText(NULL)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
