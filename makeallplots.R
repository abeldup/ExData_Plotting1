makeAllPlots <- function() {
  
  setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1")

  getSourceData()
  mdata <- readSourceData()
  
  makePlot1(mdata)
  
}