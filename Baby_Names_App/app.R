#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("US Baby Names Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput(inputId = "Names" ,
                  label = "Please enter a Name:",
                  value = "John"
                  )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         textOutput("textDisplay")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$textDisplay <- renderText(
    paste0("The name you chose:" , input$Names)
  )
    
   }

# Run the application 
shinyApp(ui = ui, server = server)

