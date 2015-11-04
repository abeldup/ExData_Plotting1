#######################################################################################################################
## Function readSourceData performs the following 
##  - Reads the data file into a data frame
##  - Converts the date and time columns 
##  - Reduces the data to only the dates required
##  - Drops rows with no observations
## Parameters: prows = number of rows to read from data file (for fast testing)
## Returns: The cleaned data frame
#######################################################################################################################

readSourceData <- function(prows = NA) {

  columnClasses = c(rep("character", 2), rep("numeric", 7))
  
  if (is.na(prows)) {
    alldata <- read.csv2("household_power_consumption.txt", 
                         header=TRUE, sep=";", na.strings=c("?"),
                         columnClasses)
  }
  else {
    alldata <- read.csv2("household_power_consumption.txt", 
                         nrows=prows, header=TRUE, sep=";", na.strings=c("?"),
                         columnClasses)
  }
  ##Convert string columns to date and time
  alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time, sep=" "), 
                               format="%d/%m/%Y %H:%M:%S")
  alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
  ##Remove the time string column
  alldata$Time <- NULL
  ##Reduce the data to the two dates
  alldata <- subset(alldata, 
                    Date >= as.Date("2007-02-01", format="%Y-%m-%d") & 
                    Date <= as.Date("2007-02-02", format="%Y-%m-%d"))
  ##Get the columns in the desired order
##  alldata <- subset(alldata, 
##                    select = c(DateTime, Date, Global_active_power, Global_reactive_power, 
##                               Voltage, Global_intensity, Sub_metering_1, 
##                               Sub_metering_2, Sub_metering_3))
  alldata <- alldata[, c(10, 1, 3, 4, 5, 6, 7, 8, 9)]
  return(na.omit(alldata))
}