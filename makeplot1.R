#######################################################################################################################
## Function makePlot1 performs the following 
##  - Calls the function to download and unzip the data
##  - Calls the function to read and clean the data 
##  - 
## Parameters: NA
#######################################################################################################################

makePlot1 <- function() {
  
  library(graphics)
  library(grDevices)
 
  setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1")
  
  getSourceData()
  mdata <- readSourceData()
  hist(mdata$Global_active_power, col="Red")
  title(main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
  
}