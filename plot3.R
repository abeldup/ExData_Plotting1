#######################################################################################################################
## Function makePlot3 performs the following 
##  - Calls the function to download and unzip the data
##  - Calls the function to read and clean the data 
##  - Activates the PNG output device and generates the line plots
##  - Closes the PNG output device
## Parameters: pdata = data frame containing the observations
##             pPNG = generate the PNG output
#######################################################################################################################

makePlot3 <- function(pdata = NULL, pPNG = TRUE) {
  
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
    png(filename = "plot3.png",
        width = 480, height = 480, 
        units = "px", pointsize = 12,
        bg = "white")
  }
  ##Create 3 y variables to plot
  y1 <- pdata$Sub_metering_1
  y2 <- pdata$Sub_metering_2
  y3 <- pdata$Sub_metering_3
  ##Plot the first, using its own range to create the scale
  plot(pdata$DateTime, y1, type="l", col="Black", 
       yaxt = "n", ylim=range(y1), 
       xlab = "", main = "", ylab = "Energy sub metering")
  axis(at = pretty(y1), side = 2)
  ##Plot the second, using the first's scale
  par(new = TRUE)
  plot(pdata$DateTime, y2, type="l", col="Red", 
       yaxt = "n", ylim=range(y1), 
       xlab = "", main = "", ylab = "")
  ##Plot the third, using the first's scale
  par(new = TRUE)
  plot(pdata$DateTime, y3, type="l", col="Blue", 
       yaxt = "n", ylim=range(y1), 
       xlab = "", main = "", ylab = "")
  ##Add the legend
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         lty=c(1,1,1), col=c("Black","Red","Blue"))
  ##Close the PNG device
  if (pPNG == TRUE) {
    dev.off()  
  }
}