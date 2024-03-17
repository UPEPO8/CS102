library(dplyr)
library(lubridate)

#Importing the 3000 movie reviews and turning it into a dataframe.
moviereview <- read.csv("C:/Users/UPEPO/Desktop/Pull/CS102 Activity 5 (Clean 3000 Reviews)/3000data.csv")
moviereview_df <- data.frame(moviereview)

#Removing all the whitespaces and \n characters. Also removing /10 to make calculations
#to fill the NA values.
moviereview_df$ratings <- gsub("\\s+|/10|\n", "", moviereview_df$ratings)
#Converting the ratings field from char to numeric.
moviereview_df$ratings <- as.numeric(moviereview_df$ratings)

#Filling the NA values with the average of the previous and next record.
fill_na <- function(x) {
  na_id <- which(is.na(x))
  for (i in na_id) {
    prev_id <- max(which(!is.na(x[1:i])))
    next_id <- min(which(!is.na(x[(i+1):length(x)]))) + i
    x[i] <- mean(c(x[prev_id], x[next_id]), na.rm = TRUE)
  }
  return(x)
}
moviereview_df$ratings <- fill_na(moviereview_df$ratings)

#Converting the date from character into date format
moviereview_df$dates <- dmy(moviereview_df$dates)

#Convert all username to lowercase
moviereview_df$names <- tolower(moviereview_df$names)

#Convert all review title to lowercase
moviereview_df$titles <- tolower(moviereview_df$titles)

#Convert all text reviews to lowercase
moviereview_df$reviews <- tolower(moviereview_df$reviews)
#Removing \n, multiple whitespaces, and \ characters.
moviereview_df$reviews <- gsub("\n|\\s{2,}|\\\\" , "", moviereview_df$reviews)
#Removing the excess sentences after the review
moviereview_df$reviews <- gsub("\\d+ out of \\d+ found this helpful", "", moviereview_df$reviews)
moviereview_df$reviews <- gsub("[?.!./.\\]\\.was this review helpful\\?sign in to vote\\.permalink", "", moviereview_df$reviews)




str(moviereview_df)

write.csv(moviereview_df, "C:/Users/UPEPO/Desktop/Pull/CS102 Activity 5 (Clean 3000 Reviews)/3000 Reviews (CLEANED).csv")
