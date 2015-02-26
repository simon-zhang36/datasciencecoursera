#1 

library(datasets)
data(iris)
data1 <- subset(iris,spe)

#3
data(mtcars)


#4
mean(mtcars[mtcars$cyl== 8,]$hp)-mean(mtcars[mtcars$cyl== 4,]$hp)
