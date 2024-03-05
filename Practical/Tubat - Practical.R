library(lubridate)
A.
#1. Find out, in a single command, which columns of warpbreaks are either numeric or integer.
str(warpbreaks)
#2. Is numeric a natural data type for the columns which are stored as such? Convert to integer when necessary.
#Yes numeric is the natural data type for the column

new_warpbreak <- as.integer(warpbreaks$breaks)
#3.Error messages in R sometimes report tshe underlying type of an object rather than the user-level class. 
#Derive from the following code and error message what the underlying type.
#Can't transform this dataset into a date

as.Date(warpbreaks)


B.
#1. Read the complete file using readLines.
exampleFile <- readLines("C:/exampleFile.txt")

#2. Separate the vector of lines into a vector containing comments and a vector
#containing the data. Hint: use grepl.

comments <- exampleFile[grepl("//", exampleFile)]
data1 <- exampleFile[grepl("^m", exampleFile, ignore.case = TRUE)]
data2 <- exampleFile[grepl("^f", exampleFile, ignore.case = TRUE)]
combinedData <- c(data1, data2)

combinedData
comments

#3.Extract the date from the first comment line.
dmy(exampleFile)

#4. Read the data into a matrix as follows.

#a. Split the character vectors in the vector containing data lines by semicolon (;)
#using strsplit.
split <- strsplit(combinedData, ";")
split

#b. Find the maximum number of fields retrieved by split. Append rows that are
#shorter with NA's.
max_fields <- max(sapply(split, length))

data <- lapply(split, function(x) c(x, rep(NA, max_fields - length(x))))
data

#c.Use unlist and matrix to transform the data to row-column format.
unlistMatrix <- matrix(unlist(data), nrow = length(data), byrow = TRUE)
unlistMatrix

#d. From comment lines 2-4, extract the names of the fields. Set these as
#colnames for the matrix you just created. 

commentField <- comments[2:4]
commentField <- gsub(" //", "", commentField)

colnames(unlistMatrix) <- commentField
unlistMatrix
