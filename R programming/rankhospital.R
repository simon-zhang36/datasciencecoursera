rankhospital <- function(state, outcome, num = "best") {
        filename <- getwd() 
        filename <- paste(filename,"/data/outcome-of-care-measures.csv",sep="")
        d <- read.csv(filename,colClasses = "character",check.names=FALSE,stringsAsFactors=FALSE)
        d <- d[,c(2,7,11,17,23)]
        colnames(d) <- c("Hospital Name","State","heart attack","heart failure","pneumonia")
        
        for (x in 3:5) {
                d[,x] <- suppressWarnings(as.numeric(d[,x]) )               
        }
        
        if (!any(d$State == state)) {
                stop("Error in best(\"",state,"\", \"", outcome,"\") : invalid state\n",sep="")
        }
        if (!any(names(d)==outcome)) {
                stop("Error in best(\"",state,"\", \"", outcome,"\") : invalid outcome\n",sep="")        
        }
        d1 <- subset(d,State == state)
        d1 <- na.omit(d1)
        d2 <- d1[order(d1[,outcome],d1[,"Hospital Name"]),]
        rank <- list(best=1,worst=nrow(d2))
        if (is.character(num)) {
                n <- rank[[num]]              
        } else {
                n <- num
                if (num > nrow(d2)) return(NA)               
        }
        return(d2[n,])
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
}