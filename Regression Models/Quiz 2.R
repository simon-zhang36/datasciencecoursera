# Q 1
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
l1 <- lm(y ~ x)
summary(l1)

# Q 3
data(mtcars)
l2 <- lm(mpg ~ wt,data = mtcars)
summary(l2)

newdata <- data.frame(wt = mean(mtcars$wt))
predict(l2,newdata,interval = "confidence")

# Q 5
l5 <- lm(mpg ~ wt,data = mtcars)
newdata <- data.frame(wt = 3)
predict(l2,newdata,interval = "prediction")

# Q 6
# store results in matrix
sumCoef <- summary(l5)$coefficients
# print out confidence interval for 2 * beta1
2*(sumCoef[2,1] + c(-1, 1) * qt(.975, df = l5$df) * sumCoef[2, 2])


# Q 9
l9_1 <- lm(mpg ~ wt,data = mtcars)
l9_2 <- lm(mpg ~ wt -wt,data = mtcars)
deviance(l9_1)/deviance(l9_2)
