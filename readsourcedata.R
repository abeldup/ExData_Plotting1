#######################################################################################################################
## Function readSourceData performs the following 
##  - Reads the data file into a data frame
##  - Converts the date and time columns 
##  - Reduces the data to only the dates required
##  - Drops rows with no observations
## Parameters: prows = number of rows to read from data file (for fast testing)
## Returns: The cleaned data frame
#######################################################################################################################

readSourceData <- function(prows = 0) {

  columnClasses = c(rep("character", 2), rep("numeric", 7))
  
  if (prows == 0) {
    alldata <- read.csv("household_power_consumption.txt", 
                          nrows=(69518-66637), header=TRUE, sep=";", na.strings=c("?"),
                          skip = 66637, columnClasses, comment.char = "")
  }
  else {
    alldata <- read.csv("household_power_consumption.txt", 
                          nrows=prows, header=TRUE, sep=";", na.strings=c("?"),
                          skip = 66637, columnClasses, comment.char = "")
  }
  names(alldata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                      "Voltage", "Global_intensity", 
                      "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
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
  alldata <- alldata[, c(9, 1, 2, 3, 4, 5, 6, 7, 8)]
  ##Return data frame without NAs
  return(na.omit(alldata))
}