#######################################################################################################################
## Function makePlot1 performs the following 
##  - Calls the function to download and unzip the data
##  - Calls the function to read and clean the data 
##  - Activates the PNG output device and generates the histogram
##  - Closes the PNG output device
## Parameters: pdata = data frame containing the observations
#######################################################################################################################

makePlot1 <- function(pdata = NULL) {
  
  library(graphics)
  library(grDevices)
 
  setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1")
  
  ##Check if data is supplied, otherwise get it
  if (is.null(pdata)) {
    getSourceData()
    pdata <- readSourceData()
  }
  ##Initialize the PNG device
  png(filename = "plot1.png",
      width = 480, height = 480, 
      units = "px", pointsize = 12,
      bg = "white")
  ##Generate the histogram
  hist(pdata$Global_active_power, col="Red", 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency",
       xlim=c(0,6),  ylim=c(0, 1200))
  ##Close the PNG device
  dev.off()  
}