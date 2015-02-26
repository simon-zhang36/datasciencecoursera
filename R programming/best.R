
best <- function(state, outcome) {
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
        minimum <- min(d1[,outcome],na.rm=TRUE)
        d2 <- d1[d1[,outcome]==minimum,]
        return(sort(d2[,1][1]))
        
}
