
  
if (getwd()!="/Users/andrey/Documents/code/R"){
  setwd("/Users/andrey/Documents/code/R/")
}
getwd()
#q2
fileUrl <- "http://simplystatistics.tumblr.com/" 
con <- url(fileUrl,"r")
simplyStats <-readLines(con,150)
close(con)
nchar(simplyStats) [c(2,45,122)]

#q3

fileUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv" 
download.file(fileUrl,destfile="./data/q2-3.csv",method="curl")
list.files("./data")


surveyData <- read.csv("./data/q2-3.csv") 
dim(surveyData)
#q4
table(surveyData$BDS>=24) 
names(surveyData)
surveyData$FES
table(surveyData$FES, useNA="ifany")
nrow(surveyData$FES)
head(surveyData,2)
#q5
table(surveyData$BDS==3 & surveyData$RMS==4) 
table(surveyData$BDS==2 & surveyData$RMS==5) 
table(surveyData$BDS==2 & surveyData$RMS==7) 

#q6 
agricultureLogical <- surveyData$ACR ==3 & surveyData$AGS==6

agricultureLogical
which(agricultureLogical)[1:3]
length(which(agricultureLogical))
 #q7
indexes = which(agricultureLogical)
subsetSurveyData  = surveyData[indexes,] 
dim(subsetSurveyData)

table(subsetSurveyData$MRGX, useNA="ifany")
sum(is.na(subsetSurveyData$MRGX))

#q8
names(surveyData)
strsplit(names(surveyData),"wgtp")[123]

#q9
quantile(surveyData$YBL,na.rm=TRUE)

#q10
file2="https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv";


download.file(file2,destfile="./data/q2-10.csv",method="curl")
list.files("./data")

surveyData2 <- read.csv("./data/q2-10.csv") 
dim(surveyData2)

housingData <- surveyData
populationData <- surveyData2

mergedData <- merge(housingData,populationData,by.x="SERIALNO",by.y="SERIALNO",all=TRUE)   

dim(mergedData)
head(mergedData,2)