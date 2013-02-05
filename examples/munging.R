if (getwd()!="/Users/andrey/Documents/code/R"){
  setwd("/Users/andrey/Documents/code/R/")
}
getwd()

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD" 
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
list.files("./data")


cameraData <- read.csv("./data/cameras.csv") 
names(cameraData)
tolower(names(cameraData))


splitNames = strsplit(names(cameraData),"\\.")

splitNames[[6]]

sapply(splitNames,function(x){x[1]})
##merge

reviews <- read.csv("./data/reviews.csv"); 
solutions <- read.csv("./data/solutions.csv") 
head(reviews,2)
head(solutions,2)

names(reviews)
names(solutions)

sub("_","",names(reviews),)

testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

reviews$time_left[1:10]
timeRanges <- cut(reviews$time_left,seq(0,3600,by=600)) 
timeRanges[1:10]
class(timeRanges)
levels(timeRanges)
table(timeRanges,useNA="ifany")

library(Hmisc)
timeRanges<- cut2(reviews$time_left,g=6) 
table(timeRanges,useNA="ifany")
reviews$timeRanges <- timeRanges 
head(reviews,2)

mergedData <- merge(reviews,solutions,all=TRUE)
head(mergedData)

mergedData2 <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE) 
head(mergedData2)

mergedData2$reviewer_id[1:10]
sort(mergedData2$reviewer_id)[1:10]
order(mergedData2$reviewer_id)[1:10]

mergedData2$reviewer_id[order(mergedData2$reviewer_id)]


head(mergedData2[,1:6],3)

sortedData <- mergedData2[order(mergedData2$reviewer_id),] 
head(sortedData[,1:6],3)

sortedData <- mergedData2[order(mergedData2$reviewer_id,mergedData2$id),] 
head(sortedData[,1:6],3)


##reshaping
misShaped <- as.data.frame(matrix(c(NA,5,1,4,2,3),byrow=TRUE,nrow=3)) 
names(misShaped) <- c("treatmentA","treatmentB")
misShaped$people <- c("John","Jane","Mary")
misShaped

library(reshape2)
melt(misShaped,id.vars="people",variable.name="treatment",value.name="value")

