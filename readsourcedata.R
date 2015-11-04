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
  ##Reduce the data to the two dates
  alldata <- subset(alldata, Date >= as.Date("2007-02-01", format="%Y-%m-%d") & Date <= as.Date("2007-02-02", format="%Y-%m-%d"))
  ##Get the columns in the desired order
  alldata <- subset(alldata, 
                    select = c(DateTime, Date, Global_active_power, Global_reactive_power, 
                               Voltage, Global_intensity, Sub_metering_1, 
                               Sub_metering_2, Sub_metering_3))
  return(na.omit(alldata))
}