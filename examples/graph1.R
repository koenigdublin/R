getwd()
pData <- read.csv("./data/ss06pid.csv")
dim(pData)
names(pData)
boxplot(pData$AGEP,col="blue")



boxplot(pData$AGEP ~ as.factor(pData$DDRS),col=c("blue","orange"),names=c("yes","no"),varwidth=TRUE)

barplot(table(pData$CIT),col="blue")

hist(pData$AGEP,col="blue")

hist(pData$AGEP,col="blue",breaks=100,main="Age")

dens <- density(pData$AGEP) 
plot(dens,lwd=3,col="blue")


dens <- density(pData$AGEP)
densMales <- density(pData$AGEP[which(pData$SEX==1)]) 
plot(dens,lwd=3,col="blue") 
lines(densMales,lwd=3,col="orange")