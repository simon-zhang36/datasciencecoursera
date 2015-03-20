# setwd("./Getting and Cleaning Data/project")

#import test data
sub.test <- read.table("./data/test/subject_test.txt",col.names = "Subject",head=FALSE)
x.test <- read.table("./data/test/X_test.txt",head=FALSE)
y.test <- read.table("./data/test/y_test.txt",col.names = "activity_label",head=FALSE)

#import train data
sub.train <- read.table("./data/train/subject_train.txt",col.names = "Subject",head=FALSE)
x.train <- read.table("./data/train/X_train.txt",head=FALSE)
y.train <- read.table("./data/train/y_train.txt",col.names = "activity_label",head=FALSE)

#import features data
features <- read.table("./data/features.txt",stringsAsFactors = FALSE)[,2]
features <- gsub("()","",gsub("-","_",features,fixed=TRUE),fixed=TRUE)

#assign features to the column name
colnames(x.test) <- features
colnames(x.train) <- features

# merge train and test data
test <- cbind(x.test,sub.test,y.test)
train <- cbind(x.train,sub.train,y.train)

# merge train and test into one
data <- rbind(train,test)

# import activity label data
labels <- read.table("./data/activity_labels.txt",head=FALSE,col.names = c("activity_label","activity"))
data <- join(data,labels,by="activity_label")
data <- data[c(562:564,1:561)]
