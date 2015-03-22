# Quiz 3
## Q1
if (!file.exists("./data")) {dir.create("./data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,destfile = "./data/housingdata.csv",method = "curl")
data1 <- read.csv("./data/housingdata.csv")
summary(data1)

agricultureLogical <- data1$ACR == 3 & data1$AGS == 6
which(agricultureLogical )

## Q2
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
download.file(fileurl2,destfile = "./data/Fjeff.jpg",method="curl")
library(jpeg)
data2 <- readJPEG("./data/Fjeff.jpg",native =TRUE)
quantile(data2,probs = c(0.3,0.8))

## Q3

data3_1 <- read.csv("./data/GDP.csv",skip=4,stringsAsFactors = FALSE)
data3_1 <- data3_1[1:190,-c(3,6:10)]
names(data3_1) <- c("CountryCode","rank","Economy","US dollars")
data3_1$rank <- as.numeric(data3_1$rank)

data3_2 <- read.csv("./data/EDSTATS_Country.csv")
library(plyr)
mergedData <- join(data3_1,data3_2,type = "inner")
d <- arrange(mergedData,desc(rank))
d[13,"Economy"]

## Q4
mean(d[d$Income.Group == "High income: OECD",]$rank,na.rm=TRUE)

mean(d[d$Income.Group == "High income: nonOECD",]$rank,na.rm=TRUE)

## Q5
d$rankGroup <- cut(d$rank,breaks = 5)
table(d$rankGroup,d$Income.Group)
