rankall <- function(outcome, num = "best") {
        ## Read outcome data
        filename <- getwd() 
        filename <- paste(filename,"/data/outcome-of-care-measures.csv",sep="")
        d <- read.csv(filename,colClasses = "character",check.names=FALSE)
        d <- d[,c(2,7,11,17,23)]
        colnames(d) <- c("hospital","state","heart attack","heart failure","pneumonia")
        for (x in 3:5) {
                d[,x] <- suppressWarnings(as.numeric(d[,x]) )               
        }
        ## Check that state and outcome are valid
        if (!any(names(d)==outcome)) {
                stop("invalid outcome\n")        
        }
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        d1 <- d[,c("hospital","state",outcome)]
        d1 <- na.omit(d1)
        
        
        
        
        d1 <- split(d1,d1$state)
        
        all <- as.data.frame(matrix(nrow=0,ncol=2))
        for (s in names(d1)){
                d2 <- d1[[s]]
                d2 <- d2[order(d2[,outcome],d2[,"hospital"]),]
                rank <- list(best=1,worst=nrow(d2))
                if (is.character(num)) n <- rank[[num]] else n <- num
                if (n > nrow(d2)) d3 <- data.frame(hospital="<NA>",state=s) else d3<- d2[n,1:2]
                rownames(d3) <- s

                all <- rbind(all,d3) 
        }
        return(all)
}