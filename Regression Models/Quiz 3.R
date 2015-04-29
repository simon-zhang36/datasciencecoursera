# Q1
data(mtcars)
summary(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
fit1 <- lm(mpg ~ cyl + wt, data = mtcars)
summary(fit1)

"-6.071"

# Q2
fit2 <- lm(mpg ~ cyl,data =mtcars)
summary(fit2)

# Q3
fit3 <- lm(mpg ~ cyl + wt + cyl * wt,data = mtcars)
summary(fit3)
anova(fit1,fit3)

"The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary."

# Q4
fit4 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit4)

"The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4, 6, 8)."
"hint: 1 ton = 2000 lb"

# Q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
plot(y ~ x)
hatvalues(lm(y ~ x))

"0.9946"

# Q6
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
dfbetas(lm(y ~ x))

"-134"