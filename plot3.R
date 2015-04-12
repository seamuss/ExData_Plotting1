### Exploratory Data Analysis - Course project 1 ###
### Plot 3 ###

# Source shared function to retrieve source file and return subset of data.
source("getChartData.R")

drawPlot3 <- function() {
    
    # Read in data set.
    chartData <- getChartData()
    
    # Open PNG device for plot.
    png(filename="plot3.png", width = 480, height = 480, bg="white")
    
    plot(Sub_metering_1 ~ DateTime,chartData, type="n", ylab="Energy sub metering", xlab="")
    points(Sub_metering_1 ~ DateTime,chartData, type="l", col="black")
    points(Sub_metering_2 ~ DateTime,chartData, type="l", col="red")
    points(Sub_metering_3 ~ DateTime,chartData, type="l", col="blue")
    
    legend("topright",lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )
    
    # Close device.
    dev.off()
}