corr <- function(directory, threshold = 0) {
    cr<- NULL
    for (i in 1:332) {
        filename = sprintf("%03d.csv",i)
        file = paste(getwd(),"/",directory,"/",filename,sep="")
        d1 <- read.csv(file,as.is= TRUE)
        d2 <- d1[complete.cases(d1),]
        n <- nrow(d2)
        if (n > threshold) {
            cr <- c(cr,cor(d2$nitrate,d2$sulfate))
        }
    }
    return(cr)        
}
