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
  national <- readRDS("C:\\Users\\marqu\\Documents\\Baby-Names\\Baby_Names_App\\National_Names.rds")

  plot <- national %>% 
          filter(Name == input$Names , Gender == input$Gender) %>%
          select(everything())

  output$TimeSeries <- renderPlot(
    qplot(as.integer(plot$Year), plot$Count , plot, geom = "line" )
  
  #output$textGender <- renderText(
   # paste0("The Gender you chose:" , input$Gender)
  #)
  
  #output$textDisplay <- renderText(
   # paste0("The name you chose:" , input$Names)
  #) 
  

  )
    
   }

# Run the application 
shinyApp(ui = ui, server = server)

