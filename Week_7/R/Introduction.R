
# R you ready? Let's go!

# Introduction

# Data types ----

# A double ("numeric") vector uses 8 bytes per element. 
# An integer vector uses only 4 bytes per element
# For large vectors, that's less wasted memory and 
# less to wade through for the CPU (so it's typically faster).
# typeof() 
# object.size()

# integer
int_value = 6L
class(int_value)

# numeric
num_value = 6.5
class(num_value)

# character
text_value = "hello"
class(text_value)

# logical (TRUE/FALSE or T/F)
logical_value = FALSE
class(logical_value)

# complex
complex_value = 2i
class(complex_value)


# R Programming Operators ----

# Arithmetic Operators

# +
5 + 5

# -
5 - 5

# *
5 * 5

# / 
5 / 5

# ^
5 ^ 5

# %% and %/%
12 %% 9
10 %/% 8


# Logical Operators

# "=="  means equal to
# "!="  means not equal to
# "<" ; ">" ; "<=" ; ">="
# "&" is "and"
# "|" is "or" 
# "!" is "not"

# == 
5 == 2 + 3

# !=
5 != 4
5 != 5

# > and <
(3 > 7) | (3 != 7)             
(3 > 7) & (3 != 7) 

# & - 'and'
2 & 2

# | - 'or' 
2 | 2


# TRUE and FALSE
# if one of them true, the it returns true because "|" evaluates one of them not both of them.
TRUE | FALSE
FALSE | FALSE
F | T
T & F
T & T


# Miscellaneous operators

# Pipe operator %>% (ctrl+shift+m)
sqrt(2)
abs(-65)
paste("1","2")
paste0("1","2")


2 %>% sqrt()
-65 %>% abs()
"1" %>% paste("2")
"1" %>% paste0("2")

# Match operator %in%
2 %in% -5:5 


# Assignment Operators "alt" + "-"

hello = 5 + 5
hello_2 <- 5 + 5
5 + 5 -> hello_3 

# Installing R Packages ----

install.packages("dplyr")
library(dplyr) 
dplyr::count()


# Data Structures ----

# Vectors ----

MyFirstVector <- c(3, 3, 45, 45, 56, 732) # combine
MyFirstVector %>% class()
MyFirstVector %>% length()
MyFirstVector %>% append(33,4) # or append(c(11,22),4)
MyFirstVector %>% range() # Returns minimum and maximum of vector
MyFirstVector %>% rev()
MyFirstVector %>% unique()


vector <- c('Ali', 'hasan')
vector %>% tolower()
vector %>% toupper()

library(Hmisc)
vector %>% capitalize()

vector %>% summary()
vector %>% str()


vec1 <- c("a", "23", "B7")    
vec1 %>% class()

vec2 <- c(2, 8, 16, 23, "37,5")  # character  
vec2 %>% class()


seq(1, 15) # sequence - 1:15
seq(1, 15, 2)

rep(3, 50) # replicate
rep("a", 5) 

x <- c(80, 20)
y <- rep(x, 10) 



w <- c("a", "b", "c", "d", "e")

w[1]
w[2] ; w[3]
w[-1]                          

w[1:3] ; w[3:5]

w[c(1,3,5)]

w[1] <- "z"

w[c(2,3)] <- c("y", "y")

w[w == "y"]

w[w != "y"]


c1 <- seq(1:9)
c2 <- -11:-19

cbind(c1,c2)

rbind(c1,c2)


# Tables ----

# Matrix

rownames = c("row1", "row2", "row3")
colnames = c("col1", "col2", "col3")

myMatrix <- matrix(data = 1:9, ncol = 3, 
                 nrow = 3, byrow = T, 
                 dimnames = list(rownames, colnames))



matrix_1 <- matrix(data = 1:9, ncol = 3, nrow = 3) 
matrix_2 <- matrix(data = 1:9, ncol = 3, nrow = 3)
matrix_1
matrix_2

matrix_3 <- cbind(matrix_1,matrix_2) 
matrix_4 <- rbind(matrix_1,matrix_2)
matrix_3;matrix_4

matrix_3[2,3]

matrix_3[2,]

matrix_3[10]

matrix_3[,3]

matrix_3[2:3,c(1,6)]


# Data Frame

data_frame <- matrix_4 %>% as.data.frame()

data_frame[2,3]
data_frame[2,]
data_frame[,3]
data_frame[2:3,c(1,3)]

data_frame[2]

data_frame[[2]]

data_frame$V2

data_frame$V2[2]



Age <- c(15, 17, 16, 15, 16)
Marks1<- c(90, 86, 70, 88, 45)
Marks2<- c(85, 80, 74, 39, 65)
Name<-c("John", "Bob", "Kevin", "Smith", "Rick")

students<-data.frame(Name, Age, Marks1, Marks2)
students



# List ----

value <- "14"

vector <- c(2,19:26,seq(25,31))

table <- matrix(vector,4,4)

data <- table %>% as.data.frame()

list <- list(value,vector,table,data)

list[[1]]

list[[3]]

list[[2]][5]

list[[4]][3,4]

list[[4]][[3]]


# Useful Shortcuts

# ctrl + shift + m    %>%
# 
# ctrl + shift + n    New R Script
# 
# ctrl + shift + h    Set As Working Directory
# 
# ctrl + shift + c    Comment
# 
# ctrl + o            Open File
# 
# alt + '-'           <-

