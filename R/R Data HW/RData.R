RData <- function()
{
 install.packages("rjson")
 library(rjson)
 df <- data.frame(reviewID = character(),
                  asin = integer(),
                  reviewText = character(),
                  overall = double(),
                  reviewTime = as.Date(character())
                  )
 #create the empty data frame 
 con <- file("review.data",open ="r")
 len <- 10001
 for (i in 1:len){
  dataIn  <- readLines(con,1)
  review <- fromJSON(dataIn)
  reviewdf  <- as.data.frame(review)
  df <- rbind(df,reviewdf)
 }
 close(con)
 View(df)
 reviews <- dataIn[dataIn$overall >= 4.0, ] 
 #should filter 4.0s or greater 
 View(reviews)
 #this will print the data frame
}

