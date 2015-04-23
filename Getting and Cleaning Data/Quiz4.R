# Q1
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileurl,destfile = "./data/ss06hid.csv",method = "curl")
data <- read.csv("./data/ss06hid.csv")
dnames <- names(data)
dnames.split <- strsplit(dnames,"\\wgtp")
dnames.split[123]

# Q2
fileurl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
download.file(fileurl2,destfile ="./data/FGDP.csv",method = "curl")
data2 <- read.csv("./data/FGDP.csv",skip =3,header = TRUE)
data2 <- data2[-c(1,192:nrow(data2)),-c(3,6:10)]
head(data2)

names(data2)[4] <- "GDP"
GDP <- as.character(data2$GDP)
GDP <- gsub(",","",GDP)
data2$GDP <- as.numeric(GDP)
mean(data2$GDP)

# Q3
country <- data2$Economy
grep("^United",country)

# Q4
names(data2)[1] <- "CountryCode"
data3 <- read.csv("./data/EDSTATS_Country.csv")
library(plyr)
data_merge <- join(data2,data3)

notes <- data_merge[,"Special.Notes"]

grep("Fiscal year end: June",notes)

# Q5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
sampledate <- ymd(sampleTimes)
    ## value collected in year 2012
sum(year(sampledate) == 2012)
    ## value collected on Monday
sum(year(sampledate) == 2012 & wday(sampledate) == 2)
