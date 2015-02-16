pollutantmean <- function(directory, pollutant, id = 1:332) {
        x = NULL
        for (i in id) {
                filename = sprintf("%03d.csv",i)
                file = paste(getwd(),"/",directory,"/",filename,sep="")
                d1<- read.csv(file,header=TRUE,as.is= TRUE)
                x <- c(x,d1[,pollutant])                
                }
        
        round(mean(x,na.rm=T), digits= 3)
        
}