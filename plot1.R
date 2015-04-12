### Exploratory Data Analysis - Course project 1 ###
### Plot 1 ###

# Source shared function to retrieve source file and return subset of data.
source("getChartData.R")

drawPlot1 <- function() {
    
    # Read in data set.
    chartData <- getChartData()
    
     # Open PNG device for plot.
    png(filename="plot1.png", width = 480, height = 480, bg="white")
    
     # Create Global Active Power plot.
    hist(chartData$Global_active_power, breaks=20, ylab="Frequency", xlab="Global Active Power (Kilowatts)", col="red", main="Global Active Power")
    
    # Close device.
    dev.off()
}
