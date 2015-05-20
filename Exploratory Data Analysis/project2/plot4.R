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

# Find coal combustion-related sources
is.combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[is.combustion.coal,]

# Find emissions from coal combustion-related sources
data4 <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

# group by year
data4 <- aggregate(Emissions ~ year, data=data4, FUN=sum)

require(ggplot2)
# Open "png" device to wirte the plot to
png(filename="plot4.png",width = 900, height = 600)

ggplot(data4,aes(x=factor(year),y=Emissions/10^6)) + 
        geom_bar(stat = 'identity') + 
        xlab("year") +
        ylab(expression("Total PM"[2.5]*" Emissions(million tons)")) +
        ggtitle("Total Emission from coal combustion-related sources in U.S.")


# Close the "png" device
dev.off()

# Clean up
rm(list=ls())

# End of script plot4.R
