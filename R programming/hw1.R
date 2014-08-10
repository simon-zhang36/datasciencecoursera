data1 <- read.csv("~/Rprojects/datasciencecoursera/R programming/data/hw1_data.csv")
colnames(data1)
data1[1:2,]
nrow(data1)
data1[152:153,]
data1[47,'Ozone']
sum(is.na(data1$Ozone))
mean(data1$Ozone,na.rm=T)

data2 <- subset(data1,Ozone >31 & Temp > 90)
data2
mean(data2$Solar.R)
data3 <- data1[data1$Month == 6,]
mean(data3$Temp)
data4 <- data1[data1$Month == 5,]
max(data4$Ozone,na.rm=T)
