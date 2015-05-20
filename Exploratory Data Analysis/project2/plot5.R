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

# Find data in the Baltimore city
data5 <- subset(NEI,fips == "24510")

# Find motor vehicle sources
is.motor.vehicle <- grepl("Mobile.*Vehicles", SCC$EI.Sector)
motor.vehicle.sources <- SCC[is.motor.vehicle,]

# Find emissions from motor vehicle sources
data5 <- NEI[(NEI$SCC %in% motor.vehicle.sources$SCC), ]

# group by year
data5 <- aggregate(Emissions ~ year, data=data5, FUN=sum)

require(ggplot2)
# Open "png" device to wirte the plot to
png(filename="plot5.png",width = 900, height = 600)

ggplot(data5,aes(x=factor(year),y=Emissions/10^3)) + 
        geom_bar(stat = 'identity') + 
        xlab("year") +
        ylab(expression("Total PM"[2.5]*" Emissions(thousand tons)")) +
        ggtitle("Total Emissions from motor vehicle sources in Baltimore City")


# Close the "png" device
dev.off()

# Clean up
rm(list=ls())

# End of script plot5.R
