# Q1
mean = 1100
S = 30
n = 9
t = qt(0.975,df = n -1)
c(mean - t*S/sqrt(n),mean + t*S/sqrt(n))

"[1077,1123]"

# Q2
mean = -2
n = 9
t = qt(0.975,df = n -1)
s = (-mean)*sqrt(n)/t
s

"2.60"

# Q3

"A paired interval"

# Q4
n = 10
mean1 = 3;var1 = 0.6
mean2 = 5;var2 = 0.68
df = (var1/n + var2/n)^2 / ( (var1/n)^2/(n-1) + (var2/n)^2/(n-1))
t = qt(0.975,df = df)
c(mean1-mean2 - t*sqrt(var1/n + var2/n),mean1-mean2 + t*sqrt(var1/n + var2/n))


"[-2.75, -1.25]"

# Q5

"The interval will be narrower."

# Q6

"When subtracting (old - new) the interval is entirely above zero. The new system appear to be effective."

# Q7
n = 9
mean1 = -3;s1 = 1.5
mean2 = 1;s2 = 1.8
Sp = sqrt(((n-1)*s1^2 + (n-1)*s2^2)/(n + n -2))
t = qt(0.95,n + n -2)
c(mean1-mean2 - t*Sp*sqrt(1/n + 1/n),mean1-mean2 + t*Sp*sqrt(1/n + 1/n))


"[-5.364, -2.636]"