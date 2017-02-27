# Baby Names
# Source: https://github.com/hadley/babynames

library('babynames')

head(applicants)
head(babynames)
head(lifetables)
head(births)

max(births$year)
colm <- subset(National_Names,National_Names$Name == 'Aurelia')
qplot(colm$Year,colm$Yr_rank, color = as.factor(colm$Gender))

least_pop <- National_Names %>%
             group_by(Year, Gender) %>%
             filter(Count == 5)


# Download data

## Names National
download.file('https://www.ssa.gov/oact/babynames/names.zip','names.zip')
unzip('names.zip', exdir = 'data')


## Names by State
download.file('https://www.ssa.gov/oact/babynames/state/namesbystate.zip','namesbystate.zip')
unzip('namesbystate.zip', exdir = 'data')

library(readr)
library(sqldf)
library(dplyr)
library(ggplot2)

# Get the list of files to combine:
filesList <- list.files(path.expand('data'), pattern="yob*", ignore.case=TRUE)
filelist_n <- length(filesList)

# Creates the final datasets

National_Names <- data.frame(Name = character(),
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

  National_Names <- rbind(National_Names,as.data.frame(tbl_names) )
}

saveRDS(National_Names, file = "National_Names.rds" )
saveRDS(National_Names, file = "National_Names.rds.bzip2", compress = "bzip2" )

National_Names_bzip <- readRDS(file = "National_Names.rds.bzip2")
identical(National_Names, National_Names_bzip)

# Graphs

qplot(colm$year,colm$n, color = as.factor(colm$sex))

