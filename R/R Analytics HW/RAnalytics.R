#Alexander Meade R Analysis HW 

 install.packages("jsonlite")
 install.packages("stringr")
 library(stringr)
 library(jsonlite)
 
 #helper function 
 nwords <- function(string, pseudo=F){
   ifelse( pseudo, 
           pattern <- "\\S+", 
           pattern <- "[[:alpha:]]+" 
   )
   str_count(string, pattern)
 }
 
 # open data
 con <- file("review.data", open="r")
 
 # feed in jsonl data line by line 
 df <- stream_in(con)
 
 amountWords <- nwords(df$reviewText)
 df$numsOfWords = amountWords
 

 
 # close review file
 close(con)
 
 #find average num of words for each level 
 mean1 <- with(df,mean(numsOfWords[overall == 1]))
 mean2 <- with(df,mean(numsOfWords[overall == 2]))
 mean3 <- with(df,mean(numsOfWords[overall == 3]))
 mean4 <- with(df,mean(numsOfWords[overall == 4]))
 mean5 <- with(df,mean(numsOfWords[overall == 5]))
 
 #print the values 
 print(mean1)
 print(mean2)
 print(mean3)
 print(mean4)
 print(mean5)
 
 #plot the overall level vs avg num of words 
 plot(xlim=c(1,5) , df$numsOfWords, ylim = c(0,500))
 
 
 closeAllConnections()

 
 