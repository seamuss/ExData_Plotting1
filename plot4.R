### Exploratory Data Analysis - Course project 1 ###
### Plot 4 ###

# Source shared function to retrieve source file and return subset of data.
source("getChartData.R")

drawPlot4 <- function() {
    
    # Read in data set.
    chartData <- getChartData()
    
    # Open PNG device for plot.
    png(filename="plot4.png", width = 480, height = 480, bg="white")
    
    # Two columns and two rows.
    par(mfrow=c(2,2))
    
    # Chart 1.
    plot(Global_active_power ~ DateTime, chartData, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
    # Chart 2.
    plot(Voltage ~ DateTime, chartData, type="l", ylab="Voltage", xlab="datetime")
    # Chart 3.
    plot(Sub_metering_1 ~ DateTime,chartData, type="n", ylab="Energy sub metering", xlab="")
    points(Sub_metering_1 ~ DateTime,chartData, type="l", col="black")
    points(Sub_metering_2 ~ DateTime,chartData, type="l", col="red")
    points(Sub_metering_3 ~ DateTime,chartData, type="l", col="blue")
    
    legend("topright",lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue") )
    
    # Chart 4.
    plot(Global_reactive_power ~ DateTime, chartData, type="l")
    
     # Close device.
    dev.off()
}