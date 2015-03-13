# Q2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

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

# Q10
qplot(Wind,Ozone,data=airquality,facets = . ~ Month)
qplot(Wind,Ozone,data=airquality,facets = . ~ Month) + geom_smooth()