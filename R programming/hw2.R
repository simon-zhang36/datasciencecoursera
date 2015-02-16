# Notes:
#       POSIXct: large integer 
#       POSIXlt: list
#       strptime
x <- 1:10
if(x >5) {
        x <- 0
}

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
z <- 10
f(3)
