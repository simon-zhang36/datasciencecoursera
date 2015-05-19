# Q1

library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)
testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[-testIndex,]
testing = adData[testIndex,]

# Q2

library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

# Q3

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

pca.index <- 58:69
pp <- preProcess(training[,pca.index],method="pca",thresh=0.8)

"7"
# Q4

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

pca.index <- 58:69
pp <- preProcess(training[,pca.index],method="pca",thresh=0.8)


training1 <- training[,pca.index]
testing1 <- testing[,pca.index]
trainPC <- predict(pp,training1)
testPC <- predict(pp,testing1)

modelFit <- train(training$diagnosis ~.,method="glm",data=training1)
modelFit.PC <- train(training$diagnosis ~.,method="glm",data=trainPC)

confusionMatrix(testing$diagnosis,predict(modelFit.PC,testPC))
confusionMatrix(testing$diagnosis,predict(modelFit.PC,testPC))

"Non-PCA Accuracy: 0.65
PCA Accuracy: 0.72 "