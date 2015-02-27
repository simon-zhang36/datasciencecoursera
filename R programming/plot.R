filename <- getwd()
filename <- paste(filename,"/R programming/data/outcome-of-care-measures.csv",sep="")
outcome <- read.csv(filename, colClasses = "character")
head(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])
