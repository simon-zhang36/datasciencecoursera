url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(url,destfile="./data/housing.csv",method="curl")

getwd()
setwd('./Getting and Cleaning Data/')
#1
d1 <- read.csv('./data/housing.csv')
head(d1,3)
sum(d1$VAL >23,na.rm=T)

#2
summary(d1$FES)
head(d1$FES)

#3
library(xlsx)
d2.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(d2.url,destfile="./data/gov_NGAP.xlsx",method="curl")

rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx('./data/gov_NGAP.xlsx',sheetIndex = 1,
                 rowIndex=rowIndex,colIndex=colIndex)
sum(dat$Zip*dat$Ext,na.rm=T) 

#4 check help page "http://stackoverflow.com/questions/23584514/error-xml-content-does-not-seem-to-be-xml-r-3-1-0"
library(XML)
d3.url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
d3 <- xmlTreeParse(d3.url,useInternal =TRUE)

rootNode <- xmlRoot(d3)
xmlName(rootNode)
names(rootNode)
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
sum(zipcode == '21231')

#5
library(data.table)
d4.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(d4.url,destfile = './data/06pid.csv',method='curl')
DT <- fread('./data/06pid.csv')

a <- c(mean(DT[DT$SEX==1,]$pwgtp15) && mean(DT[DT$SEX==2,]$pwgtp15),
       mean(DT$pwgtp15,by=DT$SEX),
       DT[,mean(pwgtp15),by=SEX],
       tapply(DT$pwgtp15,DT$SEX,mean),
       sapply(split(DT$pwgtp15,DT$SEX),mean))

system.time(mean(DT[DT$SEX==1,]$pwgtp15) && mean(DT[DT$SEX==2,]$pwgtp15))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
