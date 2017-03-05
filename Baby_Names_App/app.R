#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

# Load the data
national <- readRDS("C:\\Users\\marqu\\Documents\\Baby-Names\\Baby_Names_App\\National_Names.rds")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("US Baby Names Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput(inputId = "Gender" ,
                  label = "Please enter a Gender(F/M):",
                  value = "M"
                  ) ,
        
        textInput(inputId = "Names" ,
                  label = "Please enter a Name:",
                  value = "John"
        )
      ),
      # End of SidebarPanel
      
      # Show a plot of the generated distribution
      mainPanel(
        #textOutput("textGender") ,
        #textOutput("textDisplay") ,
         
        plotOutput("TimeSeries")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

# Time Series of Names
  # Reactive Data
  plot_data <- reactive ( { national %>% 
      filter(Name == input$Names , Gender == input$Gender) %>%
      select(Year, Count) 
  } )  
    
  output$TimeSeries <- renderPlot(
    ggplot(plot_data(), aes_string(as.integer(plot_data()$Year),plot_data()$Count)) + geom_line()
  )

      
} # End of Server function

# Run the application 
shinyApp(ui = ui, server = server)

