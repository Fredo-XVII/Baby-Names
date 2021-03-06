# Baby-Names
Analyzing baby names

# To do List:
> ### Build data:
  - Loop over states -DONE
  - Solutions: 1 put national and state data into separate data folders - DONE
  - Adjust variable names to match State data. - DONE
  - For data build, remove any graph code.  Graphing will be done in Shiny App
  - Need to save data sets as Rdata sets for Shiny App. - DONE
  - Need to convert Year to integer for final data set
-----  
> ### Build Shiny App: 
  - Gender and Name input selectors created - DONE
  - Time Series/Trend of count of names graph - DONE
  - Rank of names over time - DONE
----- 
> ### Place on Shiny website:
  - Baby_Names_App - uploaded and running on Shiny website.


# Meta Data

## Names dataset

```
National Data on the relative frequency of given names in the population of
U.S. births where the individual has a Social Security Number
 (Tabulated based on Social Security records as of March 6, 2016)
For each year of birth YYYY after 1879, we created a comma-delimited file called yobYYYY.txt.
Each record in the individual annual files has the format "name,sex,number," where name is 2 to 15
characters, sex is M (male) or F (female) and "number" is the number of occurrences of the name.
Each file is sorted first on sex and then on number of occurrences in descending order. When there is
a tie on the number of occurrences, names are listed in alphabetical order. This sorting makes it easy to
determine a name's rank. The first record for each sex has rank 1, the second record for each sex has
rank 2, and so forth.
To safeguard privacy, we restrict our list of names to those with at least 5 occurrences. 
```

## State Specific Data
```
State-specific data on the relative frequency of given names in the population
of U.S. births where the individual has a Social Security Number (Tabulated
based on Social Security records as of March 6, 2016)
For each of the 50 states and the District of Columbia we created a file called SC.txt, where SC is the
state's postal code.
Each record in a file has the format: 2-digit state code, sex (M = male or F = female), 4-digit year of
birth (**starting with 1910**), the 2-15 character name, and the number of occurrences of the name.
Fields are delimited with a comma. Each file is sorted first on sex, then year of birth, and then on
number of occurrences in descending order. When there is a tie on the number of occurrences names
are listed in alphabetical order. This sorting makes it easy to determine a name's rank. The first
record for each sex & year of birth has rank 1, the second record has rank 2, and so forth.
To safeguard privacy, we restrict our list of names to those with at least 5 occurrences. If a name has
less than 5 occurrences for a year of birth in any state, the sum of the state counts for that year will be
less than the national count.
```

# Hadley Package for BabyNames:

```
# Baby Names
# Source: https://github.com/hadley/babynames

library('babynames')

head(applicants)
head(babynames)
head(lifetables)
head(births)

max(births$year)
colm <- subset(babynames,babynames$name == 'Colm')
```
