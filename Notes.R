#Print function
x <- 1
print(x)

#Create a message for your girl
msg <- 'Hey girl'
print(msg)

#Create a list of 1-20 for y
y<-1:20
print(y)

#Everything in a vector contains objects of the same class. 
#The only exception is a list which is represented as a vector but 
#can contain objects of different classes

#NaN is an undefined value i.e. not a number.

#The c() function can create vectors of objects
x <- c(0.5,0.6)
print(x)
x <- c("a", "b", "c")
print(x)
x <- c(TRUE, FALSE)
print(x)

# The general rule in R is that the concatenate function, will kind of create the least common 
# denominator vector so, will not give you an error but what will happen is that 
# it will coerce the vector to be the, the class that's kind of the least common denominator.

y <- c(1.7, "a")

# So here, in the first example: I've got in trouble concatenating number 1.7 and 
# letter a, so clearly these are not in the same class one is numeric, and the 
# other is character. So the least common denominator here, is going to be character. 
# And so we're, so what you're going to get is that y is going to be a character vector, 
# where the first element is going to be the string 1.7 and the second element's going
# to be the, the letter A

#Note: You can comment multiple lines with cmd+shift+c

#Convert to numeric/string
x <- 0:6
#convert to numeric:
  as.numeric(x)
#convert to string:
  as.character(x)
  
#Create a matrix
#Columns get filled first in matrices
  m <- matrix(1:6, nrow=2,ncol=3)
  print(m)
  dim(m)
  
#So factor is a special type of vector, which is used to create, to represent categorical data. 
#So, and there's two types of factor, there is unordered or ordered, so you can think of this 
#as being, as storing data that are. Have labels that are categorical but have no ordering, 
#so for example male and female. Or you can have ordered factors which might represent 
# things that are ranked. So they have an order, but they're not numerical, for example you 
# know, in many universities you'll have assistant professors, associates professors, and 
# full professors. 
  
x<-factor(c("yes", "no", "yes"), levels=c("yes", "no"))

#The order of the levels in the factor, can be set using the levels argument in factors.

table(x)

# And so, there's a function in R called is.na which is used to test objects to see if they are 
# NA. To see if they are missing values in that object. There's another function called is.nan 
# which is used to test for NANs. 

# The data frame is a key data type used in R and it's used to store tabular data. 
# Data frames can be created by calling most often calling the read.table, 
# the read.csv function and we'll get into that a little bit when I talk about reading data into R. And you can also create a matrix from a data frame by calling the data.matrix a function. Now, you can't if you have a data frame that has many different types of objects, and then if you coerce that into a matrix, it's going to force so each object to be coerced so that they're all the same.

# So there are a few principle functions that we're going to talk about for reading into R. 
# The first two are read.table and read.csv and these are for reading tabular data. 

x <- read.table("hey.txt")

# And they are probably the two most commonly used functions for reading data into R. These functions 
# read text files that, that contain data that are stored in kind of rows and columns type 
# of format and return a data frame in R. The function read lines is for reading lines of a text
# file so this, this can be any type of file really, it just gives you text in a, as a character 
# vector in R. 

# Note: If there's no comment lines in your file. Then just set the comment char to be 
# the comment.char is meant to be blank. So just an empty quote there.

# You can make R run twice as fast by specifying the class of each of your columns. Quick way:
initial<-read.table("datable.txt", nrows=100)
classes<-sapply(initial,class)
tabAll<-read.table("datable.txt",colClasses=classes)

# Calculating memory requirements:
# (rows*columns*8 bytes/numeric)/2^20=megabites

# Statistics with Interactive R Learning or SWIRL for short. 
install.packages("swirl")
library(swirl)
install_from_swirl("RPprogramming")

#Activate swirl
swirl()

#End swirl by typing
bye()

#Lesson 1
#A vector is a collection of numbers.
#When carrying out calculations like:

z <- c(2,4,5)
z*2+100

#Then essentially R is recycling the 2 to make a vector of 2s and the 100 to make
#a vector of 100s. In other words: z*c(2,2,2)+c(100,100,100)

#Lesson 2
# In this lesson, you'll learn how to examine your local workspace in R and begin
# to explore the relationship between your workspace and the file system of your machine.
# Because different operating systems have different conventions with regards to
# things like file paths, the outputs of these commands may vary across machines.


#Get working directory
getwd()

# Some R commands are the same as their equivalents commands on Linux or on a
# Mac. Both Linux and Mac operating systems are based on an operating system
# called Unix. It's always a good idea to learn more about Unix!

#List all the files in your working directory using list.files() or dir()
list.files() 

#This is used to see the arguments of the list.files() command
args(list.files)

#Creates a file in your current working directory
files.create("mytest.R")

#Renames a file from x to y
file.rename(from,to)

#Create a directory in the current working directory called "testdir2" and a
#subdirectory for it called "testdir3", all in one command by using dir.create()
#and file.path().
dir.create(filepath('testdir2','testdir3'), recursive=True)

# Subsetting
# Single square bracket always returns an object of the same class as the original.
# So the subset a vector, you're going to get back a vector.

x<-c("a", "b", "c", "d")

x[1]
x[1:2]
x[x>"a"]

x<-c(1,2,"NA",3,4,"NA")
bad<-is.na(x)

#Drop all the NA elements in x
x[!bad]

# But double bracket operator is used to extract elements of a list or a data 
# frame. 

#DATAFRAMES CODING
#Note: Run lines instantly with cmb+enter

#Install necessary packages to read csv data
install.packages("data.table")
library(data.table)

#Save data
quiz_data<-fread('/Users/AlexParis/Downloads/hw1_data.csv')
quiz_data

#Column names
colnames(quiz_data)

#Retrieve first 2 rows
quiz_data[1:2]
quiz_data[c(1,2)]

#Total number of rows in data
nrow(quiz_data)

#Last 2 rows
quiz_data[152:153]

#47th row for ozone
quiz_data[47, Ozone]

#number of NA in file
sub<-subset(quiz_data, is.na(Ozone))
sub
nrow(sub)

# Can also remmove Missing Values using Something like This
quiz_data[complete.cases(quiz_data)]

#Get the mean of columns whilst ignoring NA values
colMeans(x = quiz_data, na.rm = TRUE)

#Select the subset of rows for where Ozone values > 31 and temperature above 90
#and return Solar.R column
sub<-subset(x = quiz_data, subset = Ozone > 37 & Temp > 90, select = Solar.R)
sub

#Return the average temperate when Month == 6 for Ozone
colMeans(subset(x=quiz_data, subset = Month == 6, select=Ozone), na.rm = TRUE)

#What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(subset(x=quiz_data,subset = Month == 5, select = Ozone), na.rm = TRUE)


