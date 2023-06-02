# Install required packages if not already installed
if (!require("shiny")) {
  install.packages("shiny")
}

# Load the shiny library
library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("Square Calculator"),
  sidebarLayout(
    sidebarPanel(
      # Sidebar content
      sliderInput("slider", "Select a number:", min = 1, max = 300, value = 50)
    ),
    mainPanel(
      # Output content
      verbatimTextOutput("result")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  output$result <- renderText({
    # Return the selected number squared
    input$slider^2
  })
}

# Run the application
shinyApp(ui = ui, server = server)