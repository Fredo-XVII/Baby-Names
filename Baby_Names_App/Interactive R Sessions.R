## Only run examples in interactive R sessions
if (interactive()) {
  
  ui <- fluidPage(
    textInput("caption", "Caption", "John", width = "1000px"),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    output$value <- renderText({ input$caption })
  }
  shinyApp(ui, server)
  
}

plot %>% ggplot(aes(as.integer(plot$Year),plot$Count)) + geom_line()

