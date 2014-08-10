## Quiz 1
#Question 1
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl,destfile='./1.csv',method='curl')
CommunityData <- read.csv('./Getting and Cleaning Data/1.csv')
head(CommunityData)
sum(CommunityData$VAL >= 24,na.rm= TRUE)

#Question 3
library(xlsx)
fileUrl2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx '
download.file(fileUrl2,destfile='./Getting and Cleaning Data/2.xlsx',method='curl')
rows = 18:23
cols = 7:15
dat <- read.xlsx('./Getting and Cleaning Data/2.xlsx',sheetIndex=1,rowIndex=rows,colIndex=cols,header=TRUE)
sum(dat$Zip*dat$Ext,na.rm=TRUE)

#Question 4
library(XML)
fileUrl3 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'

doc <- xmlTreeParse('./3.xml',useInternalNodes=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
zip <- xpathSApply(doc,"//zipcode",xmlValue)
sum(zip=='21231')

#Question 5
DT <- fread('./Getting and Cleaning Data/1.csv')
