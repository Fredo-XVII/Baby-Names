# server.R for BabyNames_App

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  #output$Name <- renderText({ 
    #paste("You have selected this Name:")
   # input$Name
  
  #output$TimeSeries <- renderPlot({
    
    #plot(National_Names$Year, National_Names$Count, data = subset(National_Names, Name = input$Name))

  })
})
