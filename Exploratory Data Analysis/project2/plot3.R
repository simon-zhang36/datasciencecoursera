# Initialize Variables related to data files
zipFileUrl  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
zipFile     <- "exdata_data_NEI_data.zip"
txtFileName <- "summarySCC_PM25.rds"

# Check if text data file exists, if not then download the zip file and unzip file.
if (!file.exists(txtFileName)) {
        download.file(zipFileUrl, destfile = zipFile, method = "curl")
        unzip(zipFile, unzip="internal")
        #file.remove(zipFile)
}

# Read data from the file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum the total PM2.5 emission in the Baltimore City, Maryland for each year
data3 <- subset(NEI,fips == "24510")
data3 <- aggregate(Emissions ~ year + type,
                                  data=data3,
                                  FUN=sum)


require(ggplot2)
# Open "png" device to wirte the plot to
png(filename="plot3.png",width=1200,height=400,units="px")

ggplot(data3,aes(x=factor(year),y=Emissions,fill=type)) +
        geom_bar(stat='identity') +
        facet_grid(. ~ type) +
        xlab("year") +
        ylab(expression("Total PM"[2.5]*" Emissions")) +
        ggtitle("Total Emission in Baltimore of different types")

# Close the "png" device
dev.off()

# Clean up
rm(list=ls())

# End of script plot3.R
