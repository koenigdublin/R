set.seed(41)
cauchyValues = rcauchy(100)
set.seed(415)
x = sample(cauchyValues,size=10,replace=TRUE)
library(kernlab)
data(spam)
dim(spam)
set.seed(3435)
trainIndicator = rbinom(4601,size=1,prob=0.5)
hist(trainIndicator)
trainIndicator
table(trainIndicator)
trainSpam = spam[trainIndicator==1,]
testSpam = spam[trainIndicator==0,]
dim(trainSpam)
dim(testSpam)

names(trainSpam)
head(trainSpam)

PLOTS
table(trainSpam$type)
plot(trainSpam$capitalAve ~ trainSpam$type)
table(trainSpam$capitalAve)
plot(log10(trainSpam$capitalAve+1) ~ trainSpam$type)

Relationships
plot(log10(trainSpam[,1:4]+1))

Clustering
hCluster = hclust(dist(t(trainSpam[,1:57])))
plot(hCluster)

hClusterUpdated = hclust(dist(t(log10(trainSpam[,1:55]+1))))
plot(hClusterUpdated)

Statistical prediction 

trainSpam$numType = as.numeric(trainSpam$type)-1
costFunction = function(x,y){ sum(x!=(y>0.5)) }
cvError =rep(NA,55)
library(boot)

for(i in 1:55){
  lmFormula = as.formula(paste("numType~", names(trainSpam)[i], sep=""))
  glmFit = glm(lmFormula, family="binomial", data=trainSpam)
  cvError[i]=cv.glm(trainSpam,glmFit,costFunction,2)$delta[2]
}
warnings()
which.min(cvError)

names(trainSpam)[which.min(cvError)]


MEASURE of uncertainty

predictionModel = glm(numType ~ charDollar, family="binomial", data=trainSpam)
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nonspam",dim(testSpam)[1])
predictedSpam[predictionModel$fitted > 0.5] = "spam"
table(predictedSpam, testSpam$type)
error rate of 22%
(61+458)/(1346+458+61+449)