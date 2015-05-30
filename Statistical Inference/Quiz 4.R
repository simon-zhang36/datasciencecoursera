# Q1
data1 <- data.frame(subject=c(1:5),
                    baseline=c(140,138,150,148,135),
                    week2=c(132,135,151,146,130))

t.test(data1$baseline,data1$week2,paired=TRUE)

"0.087"
# Q2
avg2 <- 1100
sd2 <- 30
n <- 9

avg2 + c(-1,1)*qt(0.975,df=n-1) * sd2/sqrt(n)

"1077 to 1123"

# Q3
pbinom(2,4,0.5,lower.tail=FALSE)

"0.31"
# Q4

ppois(10,17.97,lower.tail=TRUE)

"0.03"

# Q5
TS <- (3-1-0)/sqrt(1/9 + 1.8/9)
2 * pt(TS,df=9-1,lower.tail=FALSE)

"Less than 0.01"

# Q6
t90 <- c(1077,1123)
mean6 <- median(t90)
mean6 + c(-1,1) * 1.96/1.645 * (1123-mean6)

"No you wouldn't reject."
# Q7
pnorm(0 + qnorm(1-0.05) * 0.04/sqrt(100),mean = 0.01,sd=0.04/sqrt(100),lower.tail=FALSE)

power.t.test(n=100,delta=0.01,sd=0.04,type="one.sample",alt="one.sided")

"0.80"

# Q8
power.t.test(power=0.9,delta=0.01,sd=0.04,type="one.sample",alt="one.sided")

"140"
# Q9
"You will get larger power."