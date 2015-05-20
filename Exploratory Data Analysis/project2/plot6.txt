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

# Find motor vehicle sources
is.motor.vehicle <- grepl("Mobile.*Vehicles", SCC$EI.Sector)
motor.vehicle.sources <- SCC[is.motor.vehicle,]

# Find emissions from motor vehicle sources
data6 <- NEI[(NEI$SCC %in% motor.vehicle.sources$SCC), ]

# Seperate data in the Baltimore city and Los Angeles County
data6.Bal <- subset(data6,fips == "24510")
data6.LA <- subset(data6,fips == "06037")

# Group by year for two cities
data6.Bal <- aggregate(Emissions ~ year, data=data6.Bal, FUN=sum)
data6.Bal$City <- "Baltimore City,Maryland"

data6.LA <- aggregate(Emissions ~ year, data=data6.LA, FUN=sum)
data6.LA$City <- "Los Angeles County, California"
# Combine the two cities' data
data6 <- rbind(data6.Bal,data6.LA)

require(ggplot2)
# Open "png" device to wirte the plot to
png(filename="plot6.png",width = 900, height = 600)

ggplot(data6,aes(x=factor(year),y=Emissions,fill=City)) + 
        geom_bar(stat='identity') + 
        facet_grid(City ~ ., scales="free") +
        xlab("year") +
        ylab(expression("Total PM"[2.5]*" Emissions")) +
        ggtitle("Emissions from motor vehicle sources in Baltimore City and Los Angeles")


# Close the "png" device
dev.off()

# Clean up
rm(list=ls())

# End of script plot6.R
