## given the 2-character abbreviated name of a state and an outcome name
## the function returns the name of the hospital that has the best (lowest)
## 30 day mortality for the specified outcome in that state
best <- function(state, outcome) {
  source("helpFunc.R")
  
  options(warn=-1)  ## suppresses warnings
  
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  colNum <- checkOutcome(outcome)   # colNum is the column number for the outcome specified in the function parameter list

  if(colNum == 0) {
    ## error <- invalid outcome
    stop("invalid outcome")
  }
  
  if(!checkState(outcomeData, state)) {
    ## error <- state is not in the vector and, hence, is invalid
    stop("invalid state")
  }
  
  ## get a subset of outcomeData which contains all valid hospitals in state
  parsedData <- getHospitals(outcomeData, colNum, state)
  ## get the column with mortality rates
  mortData <- parsedData[,2]
  ## lowest mortality for the specified outcome
  minValue <- mortData[which.min(mortData)]
  ## name of the column in the data frame outcomeData that is indexed at colNum
  outcomeCol <- colnames(outcomeData)[colNum]
  ## get required observation based on the value of state and minValue
  reqData <- subset(parsedData, parsedData[outcomeCol]==as.numeric(minValue))
  ## filter the column that only gives the name of hospitals
  hospitalsVect <- reqData$Hospital.Name
  ## sort the vector of hospital names lexigraphically
  hospitalsSorted <- sort(hospitalsVect)
  ## return the first element
  print(hospitalsSorted[1])
}