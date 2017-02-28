# ui.R for BabyNames_App

#
shinyUI(
  fluidPage(
  
  # Application title
  titlePanel("Baby Names Popularity"),
  
  sidebarLayout(
    sidebarPanel( "sidebar panel",
      helpText("Create demographic maps with 
        information from the 2010 US Census.") #,
 
      #textInput("Name", 
        #        label = "Type a Name to Analyze",
       #         value = "John",
      #verbatimTextOutput("value")
      #) 
    ) ,
    
    mainPanel(textOutput("Name")
      #plotOutput("TimeSeries") 
      #textOutput("Name")
    )
  
  ))
)

