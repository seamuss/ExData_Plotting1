### Exploratory Data Analysis - Course project 1 ###

# Function to load the required packages, if the are already installed on the local machine.
# Function to install required packages, if the required packages are not on the local machine and then load these packages.
install_and_load <- function (package1,package2)  {
    
    # convert arguments to vector
    packages <- c(package1,package2)
    
    # start loop to determine if each package is installed
    for(package in packages){
        
        # if package is installed locally, load
        if(package %in% rownames(installed.packages()))
        do.call('library', list(package))
        
        # if package is not installed locally, download, then load
        else {
            install.packages(package)
            do.call('library', list(package))
        }
    }
}

download_data <- function () {
    
    if (file.exists("household_power_consumption.txt")){
        HPC_FILE <- "household_power_consumption.txt"
    }
    else{
        # Dowloading raw data
        download("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="hpc.zip", mode="curl")
        
        # Unzipping raw data
        unzip ("hpc.zip", exdir = "./")
        
        # Removing Zip file aftr the raw data is extracted into directory.
        unlink ("hpc.zip")
    }
    
}

# Calling function to check for the availablity of the required R Packages.
install_and_load('dplyr','downloader')

download_data()

getChartData <- function() {
    HPC_FILE <- "household_power_consumption.txt"
  rawData <- read.csv(HPC_FILE, sep=";", stringsAsFactors=F, na.strings="?")
  rawData$DateTime <- as.POSIXct(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")
  rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
  rawData$Time <- as.POSIXct(strptime(rawData$Time, "%H:%M:%S"))
  chartData <- subset(rawData, Date > as.Date("31/01/2007", "%d/%m/%Y") & Date < as.Date("03/02/2007", "%d/%m/%Y"))
  chartData
}