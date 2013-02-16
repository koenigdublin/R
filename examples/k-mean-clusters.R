getwd()



fileUrl <- "https://spark-public.s3.amazonaws.com/dataanalysis/quiz3question4.csv" 
download.file(fileUrl,destfile="./data/q3-4.csv",method="curl")
list.files("./data")


quizzData <- read.csv("./data/q3-4.csv") 
dim(quizzData)
subset = quizzData[,2:3]
kmeansObj = kmeans(subset,centers=2)

names(kmeansObj)

kmeansObj$cluster
#plot(quizzData$x,quizzData$y,col="blue",pch=19,cex=0.5)
x = quizzData$x
y = quizzData$y
par(mar=rep(0.2,4))
plot(x,y,col=kmeansObj$cluster,pch=19,cex=1)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)
#text(quizzData$x+0.05,quizzData$y+0.05,labels=as.character(1:12))
names(quizzData)