library("KRLS")
setwd("/Users/ayacha/Documents/2014 Fall/CS 584/HMs/Alaa_Ayach_ass4/data")

#install.packages("kernlab")
library(kernlab)

dataset<-read.table("auto-mpg.data.txt")

y = c(dataset[,2])

y[y==8] = -1
y[y==4] = 1
dataset = scale(dataset)
x = t(cbind(dataset[,1],dataset[,3]))
x = t(x)


G = gausskernel(X=x,sigma=.01)




H = as.matrix((y %*% t(y)) * (G %*% t(G)))


c = as.matrix(rep(-1, dim(x)[1]))


A = t(y)
b = 0
r = 0
l = matrix(rep(0, dim(x)[1]))
u = matrix(rep(10, dim(x)[1]))
sv = ipop(c, H, A, b, l, u, r)

alpha = primal(sv)

seq = dim(as.matrix(y))[1]
w = 0
for(i in 1:seq) {
  w = w + alpha[i] * y[i] * x[i,]
}


sum=0
for(i in 1:seq) {
  sum = sum + y[i] - t(w) %*% x[i,]
}
w0 = sum / dim(as.matrix(y))[1]


g =c()
for(i in 1:seq) {
  g = c(g, w0 + t(w) %*% x[i,])
}
yhat <- ifelse(g > 0, 1, -1)
confusionMatrix=table(yhat, y)
confusionMatrix




