# ui.R for BabyNames_App

#
shinyUI(
  fluidPage(
  
  # Application title
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel( "sidebar panel",
      helpText("Create demographic maps with 
        information from the 2010 US Census."),
 
      selectInput("var", 
                label = "Choose a variable to display",
                choices = list("Percent White", "Percent Black",
                               "Percent Hispanic", "Percent Asian"),
                selected = ("Percent White")
      ) 
    ) ,
    mainPanel(h1("Main Panel"))
  )) 
)
