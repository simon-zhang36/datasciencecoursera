# Q1
library(MASS)
data(shuttle)
d1 <- shuttle
summary(d1)
levels(d1$use) <- c("1","0")

fit1 <- glm(use ~ wind , data = d1, family = "binomial")
summary(fit1)

exp(summary(fit1)$coefficients[2,1])

"0.969"

# Q2
fit2 <- glm(use ~ wind + magn, data = d1, family = "binomial")
summary(fit2)

exp(summary(fit2)$coefficients[2,1])

"0.969"

# Q3

"The coefficients reverse their signs."

# Q4
data(InsectSprays)
summary(InsectSprays)
plot(count ~ spray,data = InsectSprays)
fit4 <- glm(count ~ spray,data = InsectSprays, family = "poisson")
summary(fit4)

1/exp(summary(fit4)$coefficients[2,1])

"0.9457"

# Q5

"Note, the coefficients are unchanged, except the intercept, which is shifted by log(10). Recall that, except the intercept, all of the coefficients are interpretted as log relative rates when holding the other variables or offset constant. Thus, a unit change in the offset would cancel out. This is not true of the intercept, which is interperted as the log rate (not relative rate) with all of the covariates set to 0."

# Q6
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

knots <- 0; 
# define the ()+ function to only take the values that are positive after the knot pt
splineTerms <- sapply(knots, function(knot) (x > knot) * (x - knot))
# define the predictors as X and spline term
xMat <- cbind(x, splineTerms)
# fit linear models for y vs predictors 
yhat <- predict(lm(y ~ xMat - 1))

# plot data points (x, y)
plot(x, y, frame = FALSE, pch = 21, bg = "lightblue")
# plot fitted values
lines(x, yhat, col = "red", lwd = 2)

# xMat is the estimate of the correction of the slope when the third column is not equal to zero, correction of the slope after you passed the knot point
