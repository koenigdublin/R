library(ElemStatLearn)
data(zip.train)

dim(zip.train)
head(zip.train)

# Create an image matrix for the 3rd row, which is a 4
?zip2image
im3 = zip2image(zip.train,3)
image(im3)
heatmap(im3)

im8 = zip2image(zip.train,8)
image(im8)

im18 = zip2image(zip.train,18)
image(im18)

im = im18
svd_cur = svd(im)
#pca1 <- prcomp(im)


# vectors U and V
par(mfrow=c(1,3))
image(im)
#image(t(im)[,nrow(im):1])
plot(svd_cur$u[,1],xlab="Row",pch=19)
plot(svd_cur$v[1,],pch=19)

# vector D
par(mfrow=c(1,3))
image(im)
#image(t(im)[,nrow(im):1])
plot(svd_cur$d,xlab="Column",ylab="Singluar value",pch=19)
plot(svd_cur$d^2/sum(svd_cur$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)
par(mfrow=c(1,1))
svd_cur$d^2/sum(svd_cur$d^2)
plot(svd_cur$d^2/sum(svd_cur$d^2),xlab="Column",ylab="Percent of variance explained",pch=19)
#9.799415e-01
#4.819116e-01

# 
