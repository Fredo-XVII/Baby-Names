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

plot %>% ggplot(aes_string(as.integer(plot$Year),plot$Count)) + geom_line()

qplot(as.integer(plot$Year), plot$Count , plot, geom = "line" )

nms_tot_yr_gndr <- national %>%
  group_by(Year, Gender) %>%
  summarise(Total = sum(Count))
select(Year, Gender, Total)
