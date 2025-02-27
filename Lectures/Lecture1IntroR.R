# ENTM6820 INTRO TO R 

#### This is a section ####
# Learning Objectives

# Use basic math operators 
# Know data types
# Install packages 
# Load data into R from a .csv or .txt files

#### Exercise #1 ####
# R is a big calculator 
2+2
2-2
2/2
2*2 

#### Exercise #2 ####
# Objects

#this is a numeric variable
x <- 2
y = 3
x + y

#this is a character variable 
name <- "Madelyn"
seven <- "7"

x + seven #this returns an error because seven is a character var

class(seven) #this is a function that returns the class of a variable

# Concantinate function
vec <- c(1, 2, 3, 4, 5, 6, 7)
vec1 <- c(1:7)
vec2 <- 1:7
vec3 <- c("Zach", "Sarah")
vec <- c(TRUE, FALSE, TRUE)

vec[4] #selects 4th value of object
vec + 2 #adds to each value in vector

# Basic Functions in R
mean(vec)
sd(vec)
sum(vec)
min(vec)
max(vec)
summary(vec)
abs(vec)
sqrt(vec)
sqrt(sum(vec))
log(vec) #natural log
log10(vec)
exp(vec)

#### Logical Operators ####
# > greater than
# < less than
# & and
# or |
# = equals (used to assign values from left to right) 
# == exactly equal to (used for showing equality between values)
# >= greater than or equal to
# != not equal to

1 > 2 #returns FALSE
1 == 1 #Is 1 equal to 1? returns TRUE
1 = 1 #Error, can't assign value of 1 to 1

t <- 1:10

# Values of t such that t is greater than 8 or such that t is less than 5
t[(t>8) | (t<5)] 
# Values of t such that t is greater than 8 and less than 10 
t[(t>8) & (t<10)] 
# Elements of t that are not exactly equal to 2 
t[t != 2]

# ask R if a number exists in a vector 
32 %in% t


#### Data types ####
# scalar objects 
x
# vectors 
t 

# Matrix - data frame with only one data class 
# example of a numeric matrix
mat1 <- matrix(data = c(1,2,3), nrow = 3, ncol = 3)
# example of a character matrix
mat2 <- matrix(data = c("Zach", "Joe", "Mitch"))
mat1[4] # returns 4th number in matrix
mat1[1,3] # first row, third col
mat1[1,] # returns first row
mat1[,3] # returns third col


# Dataframes - like an excel workbook 
# dataframes are basically matrices but with multiple data classes or data types (i.e. logical AND numeric)

df <- data.frame(mat1[,1], mat2[,1]) # create df 
colnames(df) <- c("value", "name") # renames columns

# Indexing dataframes
df[1] # returns  1st column
df[1,2] # first row, second col
df[, "value"] #returns column named "value"

df$value # another way to access column by name
df$name[1] # 1st value in name col

# Subsetting dataframes
# the element in the value column such that name is equal to Joe
df$value[df$name == "Joe"]
df$value[df$name %in% c("Joe", "Mitch")]
df$value[df$name != c("Zach")]
# returns elements of value column such that name is not equal to Jay and Mitch 
df$value[!df$name %in% c("Joe", "Mitch")]

# subset function 
subset(df, name == "Joe")

# make a new column
df$log_value = log(df$value)


#### Installing packages ####
install.packages("tidyverse") # installs package from CRAN repository
library(tidyverse) # loads function into R 

#### Read data into R ####
# CSV (comma delimited) or TXT (different delimiters)
csv <- read.csv("C:/Users/mgt19/Downloads/TestData2024.csv", na.strings = "na") # insert full file path here, can tell R what missing values are called in your csv, ex: na
getwd()
