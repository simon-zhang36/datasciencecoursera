complete <- function(directory, id = 1:332) {
        nobs <- NULL
        k = 1
        for (i in id) {
                filename = sprintf("%03d.csv",i)
                file = paste(getwd(),"/",directory,"/",filename,sep="")
                d1 <- read.csv(file,header=TRUE,as.is= TRUE)
                d2 <- d1[complete.cases(d1),]
                nobs <- c(nobs,nrow(d2))
        }
        d <- data.frame(id,nobs,stringsAsFactors = FALSE)
        d
}