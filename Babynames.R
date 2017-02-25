# Baby Names
# Source: https://github.com/hadley/babynames

library('babynames')

head(applicants)
head(babynames)
head(lifetables)
head(births)

max(births$year)
colm <- subset(babynames,babynames$name == 'Colm')


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

# Look at data

tbl_names <- read.csv.sql('data/yob1880.txt', sql = "select * from file", header = FALSE)
colnames(tbl_names) <- c('Name','Gender','Count')

tbl_names$yr_rank <- rank(-c(tbl_names$Count), ties.method = 'min')

tbl_names <- tbl_names %>% 
              group_by(Gender) %>%
              mutate( yr_rank = row_number() )


National_Names <- 