# Q1

"11%"

# Q2

"0.75"

# Q3

"P*X = (1-P)*Y"

# Q4

"The median must be 0."

# Q5
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp

sum(temp[1,] * temp[2,])

"3"

# Q6

a <- 0.75*0.30/(0.75*0.3 + 0.48*0.70)
a

"0.40"