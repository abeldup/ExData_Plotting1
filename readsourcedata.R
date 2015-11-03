readSourceData <- function(prows = NA) {

  if (is.na(prows)) {
    alldata <- read.csv2("household_power_consumption.txt", 
                         header=TRUE, sep=";", na.strings=c("?"))
  }
  else {
    alldata <- read.csv2("household_power_consumption.txt", 
                         nrows=prows, header=TRUE, sep=";", na.strings=c("?"))
  }
  ##Convert string columns to date and time
  alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
  ##Remove the time string column
  alldata$Time <- NULL
  ##Get the columns in the desired order
  alldata <- select(alldata, DateTime, Date:Sub_metering_3)
  return(na.omit(alldata))
}