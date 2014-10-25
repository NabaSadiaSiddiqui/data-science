corr <- function(directory, threshold=0) {
  log <- capture.output(cob <- complete(directory))  # data frame capturing no. of completely observed cases in each file  
  cobTh <- subset(cob, cob["nobs"]>threshold) # data frame containing only cases that meet the threshold requirement

  resVect <- c()
  
  nr <- nrow(cobTh)
  counter <- 1
  while(counter <= nr) {
    tmpRow <- cobTh[counter,]
    id <- tmpRow["id"]
    
    if(id < 100) {
      id <- if(id < 10) {
        paste("00", id, sep="")
      } else {
        paste("0", id, sep="")
      }
    }
    
    fileIO <- paste(directory, "/", id, ".csv", sep="")
    myData <- read.csv(fileIO)
    colSul <- myData["sulfate"]
    colNit <- myData["nitrate"]
    res <- cor(colSul, colNit, use="complete.obs")     
    
    resVect <- c(resVect, res)
    
    counter <- counter + 1
  }
  
  resVect
}