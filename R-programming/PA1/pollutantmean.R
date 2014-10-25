pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  dF <- data.frame()
  
  for(el in id) {        
    if(el < 100) {
      el <- if (el < 10) {
        paste("00", el, sep="")
      }
      else {
        paste("0", el, sep="")
      }
    }
    
		fileIO <- paste(directory, "/", el, ".csv", sep="")
		myData <- read.csv(fileIO)
  
    dF <- rbind(dF, myData)
	}
  
  pMean <- mean(dF[,pollutant], na.rm = TRUE)
  
  print(pMean)
}