#######################################################################################################################
## Function makePlot2 performs the following 
##  - Calls the function to download and unzip the data
##  - Calls the function to read and clean the data 
##  - Activates the PNG output device and generates the line plot
##  - Closes the PNG output device
## Parameters: pdata = data frame containing the observations
##             pPNG = generate the PNG output
#######################################################################################################################

makePlot2 <- function(pdata = NULL, pPNG = TRUE) {
  
  library(graphics)
  library(grDevices)
  
  setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1")
  
  ##Check if data is supplied, otherwise get it
  if (is.null(pdata)) {
    getSourceData()
    pdata <- readSourceData()
  }
  ##Initialize the PNG device
  if (pPNG == TRUE) {
    png(filename = "plot2.png",
        width = 480, height = 480, 
        units = "px", pointsize = 12,
        bg = "white")
  }
  ##Generate the line plot
  plot(pdata$DateTime, pdata$Global_active_power, 
       type="l", col="Black", main="", 
       ylab="Global Active Power (kilowatts)", xlab="")
  ##Close the PNG device
  if (pPNG == TRUE) {
    dev.off()  
  }
}