#######################################################################################################################
## Function makePlot1 performs the following 
##  - Calls the function to download and unzip the data
##  - Calls the function to read and clean the data 
##  - 
## Parameters: pdata = data frame containing the observations
#######################################################################################################################

makePlot1 <- function(pdata = NULL) {
  
  library(graphics)
  library(grDevices)
 
  setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1")
  
  if (is.null(pdata)) {
    getSourceData()
    pdata <- readSourceData()
  }
  
  png(filename = "plot1.png",
      width = 480, height = 480, 
      units = "px", pointsize = 12,
      bg = "white")

  hist(pdata$Global_active_power, col="Red", 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency",
       xlim=c(0,6),  ylim=c(0, 1200))
  
  dev.off()
  
}