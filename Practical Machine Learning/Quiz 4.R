# Q1 ----------
library(ElemStatLearn)
library(caret)
library(randomForest)
set.seed(33833)

data(vowel.train)
data(vowel.test) 
summary(vowel.train)
vowel.train$y <- factor(vowel.train$y)
vowel.test$y <- factor(vowel.test$y)

rf <- train(y ~ . ,data=vowel.train,method="rf",prox=TRUE,ntree=500)

gbm <- train(y ~ .,data=vowel.train,method ="gbm",verbose=F)

pred.rf <- predict(rf,vowel.test)
pred.gbm <- predict(gbm,vowel.test)

# Get the accuracy for the tree and the gbm
rf_accuracy = sum(pred.rf == vowel.test$y) / length(pred.rf)
gbm_accuracy = sum(pred.gbm == vowel.test$y) / length(pred.gbm)

# Get the last part of the answer
agreeSub = vowel.test[pred.rf == pred.gbm,]
pred.comb = predict(rf, agreeSub)
comb_accuracy = sum(pred.comb == agreeSub$y) / length(pred.comb)

rf_accuracy * (1-gbm_accuracy) + gbm_accuracy * (1 - rf_accuracy) + rf_accuracy * gbm_accuracy 

# Another solution
combinedTestData <- data.frame(rf.pred=pred.rf,
                               gbm.pred=pred.gbm,
                               y=vowel.test$y)
sum()
# Q2 ----------
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(62433)
