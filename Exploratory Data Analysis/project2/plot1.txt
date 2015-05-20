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

# Sum the total PM2.5 emission for each year
data1 <- aggregate(Emissions ~ year, NEI, sum)

# Open "png" device to wirte the plot to
png(filename="plot1.png")

barplot(height=data1$Emissions/10^6,
        names.arg=data1$year,
        xlab="years", 
        ylab=expression('Total PM'[2.5]*' Emission(million tons)'),
        main="Total Emission in the United States")

# Close the "png" device
dev.off()

# Clean up
rm(list=ls())

# End of script plot1.R
