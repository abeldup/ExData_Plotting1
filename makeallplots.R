makeAllPlots <- function(pPNG = TRUE) {
  
  setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1")

  getSourceData()
  mdata <- readSourceData()
  
  makePlot1(mdata, pPNG)
  makePlot2(mdata, pPNG)
  makePlot3(mdata, pPNG)
  makePlot4(mdata, pPNG)
  
}