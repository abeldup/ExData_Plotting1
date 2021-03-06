#######################################################################################################################
## Function getSourceData performs the following 
##  - Checks if the zipped data file exists
##  - Downloads the zipped data file 
##  - Unzips the data file
## Parameters: NA
#######################################################################################################################

getSourceData <- function() {
  
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if(!file.exists("household_power_consumption.zip")) {
    download.file(fileURL, destfile = "household_power_consumption.zip", method="curl")
    unzip("household_power_consumption.zip")
  }
  
}
