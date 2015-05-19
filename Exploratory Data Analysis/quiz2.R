# Q1
y <- c(1,2,3,4,5)
x <- c(1,2,3,4,5)
class(xyplot(y~x))

"an object of class "trellis""


# Q2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

"A set of 3 panels showing the relationship between weight and time for each diet."

# Q4
library(datasets)
library(lattice)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month),data=airquality)


# Q7
library(datasets)
data(airquality)
library(ggplot2)
airquality <- transform(airquality, Month = factor(Month))
qplot(Wind,Ozone,data=airquality,facets = . ~ Month)

# Q9
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)

# Q10
qplot(Wind,Ozone,data=airquality,facets = . ~ Month)
qplot(Wind,Ozone,data=airquality,facets = . ~ Month) + geom_smooth()