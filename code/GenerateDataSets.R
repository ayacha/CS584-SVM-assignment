setwd("/Users/ayacha/Documents/2014 Fall/CS 584/HMs/Alaa_Ayach_ass4/")

#Separable Dataset
att1 <- rnorm(250, mean=65, sd=4.58)
att2 <- rnorm(250, mean=100, sd=4.58)
class <- as.vector(rep(8, 250))
df1 <-data.frame(att1, att2, class)
plot1 <-data.frame(att1, att2)

att1 <- rnorm(250, mean=65, sd=4.58)
att2 <- rnorm(250, mean=70, sd=4.58)
class <- as.vector(rep(4, 250))
df2 <-data.frame(att1, att2, class)
plot2 <-data.frame(att1, att2)

ds = rbind(df1, df2)

f1.range = range(plot1)
f2.range = range(plot2)
plot(plot1, broken = TRUE, bcontrol = list(style = "gap"), ylim = range(f1.range, f2.range))
par(new=T)
plot(plot2, ylim = range(f1.range, f2.range), pch=24, xaxt='n')





#Non-Separable Dataset
att1 <- rnorm(250, mean=65, sd=4.58)
att2 <- rnorm(250, mean=100, sd=4.58)
class <- as.vector(rep(8, 250))
df1 <-data.frame(att1, att2, class)
plot1 <-data.frame(att1, att2)

att1 <- rnorm(250, mean=65, sd=4.58)
att2 <- rnorm(250, mean=85, sd=4.58)
class <- as.vector(rep(4, 250))
df2 <-data.frame(att1, att2, class)
plot2 <-data.frame(att1, att2)

ds = rbind(df1, df2)

f1.range = range(plot1)
f2.range = range(plot2)
plot(plot1, broken = TRUE, bcontrol = list(style = "gap"), ylim = range(f1.range, f2.range))
par(new=T)
plot(plot2, ylim = range(f1.range, f2.range), pch=24, xaxt='n')


