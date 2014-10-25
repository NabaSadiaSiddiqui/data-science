complete <- function(directory, id = 1:332) {
  df <- data.frame()
    
  for (el in id) {
    dfID = el
    
    if(el < 100) {
      el <- if( el < 10) {
        paste("00", el, sep="")
      } else {
        paste("0", el, sep="")
      }
    }
    
    fileIO <- paste(directory, "/", el, ".csv", sep="")
    myData <- read.csv(fileIO)
    validData <- na.omit(myData)
    nob <- nrow(validData)
    
    nData <- c(dfID, nob)
    df <- rbind(df, nData)
  }
  
  colnames(df) <- c("id", "nobs")
  
  print(df)
}