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

State_Names <- data.frame(Name = character(),
                             Gender=character(), 
                             Count=integer(),
                             Yr_rank=integer(),
                             Year=integer())

# Testing the loop
for (i in 1:filelist_n) {
  print("File being processed:")
  print(filesList[[i]])
  
  #Main body of the data processing
  
  tbl_names <- read.csv.sql(sprintf('data/%s',filesList[[i]]), sql = "select * from file", header = FALSE)
  colnames(tbl_names) <- c('Name','Gender','Count')
  
  tbl_names <- tbl_names %>% 
    group_by(Gender) %>%
    mutate( Yr_rank = row_number() )
  
  
  # End of data processing 
  
  # Create Year variable
  tbl_names$Year <- substr(filesList[[i]],4,7) 
  
  State_Names <- rbind(State_Names,as.data.frame(tbl_names) )
}



for (i in 1:filelist_n) {
  print("File being processed:")
  print(filesList[[i]])
  print(sprintf('data/%s',filesList[[i]]))
}

# Graphs

qplot(colm$year,colm$n, color = as.factor(colm$sex))

