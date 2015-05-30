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



# Q9
"You will get larger power."