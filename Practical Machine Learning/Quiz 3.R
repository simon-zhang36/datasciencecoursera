# Q1
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
inTrain <- createDataPartition(segmentationOriginal$Case,p=0.75,list=FALSE)
training <- segmentationOriginal[inTrain,]
testing <- segmentationOriginal[-inTrain,]

set.seed(125)
require(rpart)
model1 <- train(Class ~.,data = training,method = "rpart")
print(model1$finalModel)

testdata <- data.frame(TotalIntenCh2=c(23000,50000,57000,NA),
                       FiberWidthCh1 = c(10,10,8,8),
                       VarIntenCh4=c(NA,100,100,100),
                       PerimStatusCh1=c(2,NA,NA,2))


"PS,PS,PS,Not possible to predict"


# Q2


"The bias is larger and the variance is smaller. Under leave one out cross validation K is equal to the sample size."


# Q3
library(pgmm)
data(olive)
olive = olive[,-1]

model3 <- train(Area ~ .,data = olive,method ="rpart")
    
    
newdata = as.data.frame(t(colMeans(olive)))
predict(model3,newdata)

"2.875. It is strange because Area should be a qualitative variable - but tree is reporting the average value of Area as a numeric variable in the leaf predicted for newdata"


# Q4
library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)
model4 <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl,
                data = trainSA,
                method = "glm",family="binomial")
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

missClass(trainSA$chd,predict(model4,trainSA))
missClass(testSA$chd,predict(model4,testSA))

"Test Set Misclassification: 0.31 
Training Set: 0.27"

# Q5
library(ElemStatLearn)
library(randomForest)
data(vowel.train)
data(vowel.test) 
vowel.train <- transform(vowel.train,y=factor(y))
vowel.test <- transform(vowel.test,y=factor(y))

set.seed(33833)


model5 <- randomForest(y ~.,data=vowel.train)
# control <- trainControl(method = "cv")
# model5 <- train(y ~.,data=vowel.train,method="rf",trainControl=control)
# importance <- varImp(model5, scale=FALSE)
order(varImp(model5), decreasing=T)

"2  1  5  6  8  4  9  3  7 10"
