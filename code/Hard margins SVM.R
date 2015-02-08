setwd("/Users/ayacha/Documents/2014 Fall/CS 584/HMs/Alaa_Ayach_ass4/")

#install.packages("kernlab")
library(kernlab)

dataset<-read.table("auto-mpg.data.txt")

require(kernlab)
y = c(dataset[,2])

y[y==8] = -1
y[y==4] = 1
dataset = scale(dataset)
x = t(cbind(dataset[,1],dataset[,3]))
x = t(x)



c = as.matrix(rep(-1, dim(x)[1]))
H = as.matrix((y %*% t(y)) * (x %*% t(x)))
A = t(y)
b = 0
r = 0
l = matrix(rep(0, dim(x)[1]))
u = matrix(rep(10, dim(x)[1]))
sv = ipop(c, H, A, b, l, u, r)

alpha = primal(sv)



seq = dim(as.matrix(y))[1]

SVMs = matrix(,nrow = 2, ncol = 2)
for(i in 1:seq) {
  if(abs(alpha[i]-1)<0.7)
  {
    v1 <- c(x[i,1], x[i,2])
    SVMs = rbind(SVMs, v1)
  }
}
SVMs <- SVMs[-1:-2,]


f1.range = range(x)
f2.range = range(SVMs)
#plot(x, ylim = range(f1.range, f2.range))
plot(x, broken = TRUE, bcontrol = list(style = "gap"), ylim = range(f1.range, f2.range))

par(new=T)
plot(SVMs, pch=24, xaxt='n', yaxt = 'n')

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


