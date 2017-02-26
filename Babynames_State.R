# Baby Names by State

# Install packages
library(readr)
library(sqldf)
library(dplyr)
library(ggplot2)
library(purrr)

# Download data

## Names by State
download.file('https://www.ssa.gov/oact/babynames/state/namesbystate.zip','namesbystate.zip')
unzip('namesbystate.zip', exdir = 'data_states')


# Get the list of files to combine:
filesList <- list.files(path.expand('data_states'), pattern="*.txt", ignore.case=TRUE)
filelist_n <- length(filesList)


# Creates the final datasets

State_Names <- data.frame(State = character(),
                             Gender=character(), 
                             Year=integer(),
                             Name = character(),
                             Count=integer(),
                             St_Yr_rank=integer()
                             )
                             
 
# Testing the loop
for (i in 1:filelist_n) {
  print("File being processed:")
  print(filesList[[i]])
  
  #Main body of the data processing
  
  tbl_names <- read.csv.sql(sprintf('data_states/%s',filesList[[i]]), sql = "select * from file", header = FALSE)
  colnames(tbl_names) <- c('State','Gender','Year','Name','Count')
  
  tbl_names <- tbl_names %>% 
    group_by(Gender,Year) %>%
    mutate( Yr_rank = row_number() )
  
  
  # End of data processing 
  
  State_Names <- rbind(State_Names,as.data.frame(tbl_names) )
}


# Graphs

qplot(colm$year,colm$n, color = as.factor(colm$sex))

