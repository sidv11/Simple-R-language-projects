library(shiny)

# Function to check if a number is prime
is_prime <- function(num) {
  if (num <= 1)
    return(FALSE)
  for (i in 2:sqrt(num)) {
    if (num %% i == 0)
      return(FALSE)
  }
  return(TRUE)
}

# Define UI
ui <- fluidPage(
  titlePanel("Prime Number Finder"),
  sidebarLayout(
    sidebarPanel(
      numericInput("start", "Start:", value = NULL),
      numericInput("end", "End:", value = NULL),
      actionButton("find", "Find Primes"),
      actionButton("reset", "Reset")
    ),
    mainPanel(
      h3("Prime Numbers"),
      verbatimTextOutput("prime_result")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Find prime numbers when Find Primes button is clicked
  observeEvent(input$find, {
    if (!is.null(input$start) && !is.null(input$end) && input$start <= input$end) {
      primes <- c()
      for (num in input$start:input$end) {
        if (is_prime(num))
          primes <- c(primes, num)
      }
      output$prime_result <- renderPrint(primes)
    }
  })
  
  # Reset inputs and results
  observeEvent(input$reset, {
    updateNumericInput(session, "start", value = NULL)
    updateNumericInput(session, "end", value = NULL)
    output$prime_result <- renderText(NULL)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
