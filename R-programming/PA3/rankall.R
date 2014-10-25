rankall <- function(outcome, num = "best") {
  source("rankhospital.R")
  
  options(warn=-1)  ## suppresses warnings
  
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  statesVect <- unique(outcomeData$State)
  hospVect <- vector()
  for(state in statesVect) {
    log <- capture.output(rankhospital(state, outcome, num)) # get the hospital of rank num in state and for specified outcome   
    hosp <- substr(log, 6, nchar(log)-1)  ## parse log to remove "[1] \" from the beginning of the output of each line
    if(hosp=="") {
      hosp <- NA
    }
    hospVect <- c(hospVect, hosp)
  }
  
  df <- data.frame()
  df <- cbind(hospVect, statesVect)
  colnames(df) <- c("hospital", "state")
  rownames(df) <- statesVect
  return(data.frame(df))  ## manually set to class data frame because it is being interprted as a matrix otherwise
}