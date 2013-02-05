
if (getwd()!="/Users/andrey/Documents/code/R"){
  setwd("/Users/andrey/Documents/code/R/")
}
getwd()


fileUrl1 <- "https://dl.dropbox.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropbox.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl") 
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv"); 
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

sum(is.na(reviews$time_left))
table(is.na(reviews$time_left))

table(reviews$accept, useNA="ifany")

colSums(reviews, na.rm=TRUE)
colMeans(reviews, na.rm=TRUE)
rowSums(reviews, na.rm=TRUE)