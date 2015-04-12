### Exploratory Data Analysis - Course project 1 ###
### Plot 2 ###

# Source shared function to retrieve source file and return subset of data.
source("getChartData.R")

drawPlot2 <- function() {
    
    # Read in data set.
    chartData <- getChartData()
    
    # Open PNG device for plot.
    png(filename="plot2.png", width = 480, height = 480, bg="white")
   
    # Create Global Active Power plot.
    plot(Global_active_power ~ DateTime, chartData, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
    
    # Close device.
    dev.off()
}