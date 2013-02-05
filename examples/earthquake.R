setwd("./Documents/code/R/")
getwd()

fileUrl <- "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt"
download.file(fileUrl,destfile="./data/earthquakeData.csv",method="curl") 
dateDownloaded <- date()
dateDownloaded

eData <- read.csv("./data/earthquakeData.csv")
eData
dim(eData)
names(eData)
quantile(eData$Lat)
summary(eData)
class(eData)

sapply(eData[1,],class)

??factor
unique(eData$Src)
length(unique(eData$Src))

table(eData$Src)

eData[eData$Lat > 0 & eData$Lon > 0,c("Lat","Lon")]