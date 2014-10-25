rankhospital <- function(state, outcome, num) {
  source("helpFunc.R")
  
  options(warn=-1)  ## suppresses warnings
  
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  colNum <- checkOutcome(outcome)   # colNum is the column number for the outcome specified in the function parameter list

  if(colNum == 0) {
    ## error <- invalid outcome
    stop("invalid outcome")
  }
  
  if(!checkState(outcomeData, state)) {
    ## error <- invalid state
    stop("invalid state")
  }

  ## get a subset of outcomeData which contains all valid hospitals in state
  hospDF <- getHospitals(outcomeData, colNum, state)  
  
  if(!checkRank(hospDF, num)) {
    return(NA)
  }
  
  ## everything is good...proceed!  

  mortRate <- hospDF[,2]
  rankedRate <- sort(mortRate)
  
  tgtRate <- 0  ## tgtRate is the rate based on rank num
  if(is.numeric(num)) {
    tgtRate <- rankedRate[num]
  }
  else if(num=="best") {
    tgtRate <- rankedRate[1]
  }
  else if(num=="worst") {
    tgtRate <- rankedRate[length(rankedRate)]
  }

  ## name of the column in the data frame outcomeData which tells the Rate
  cname <- colnames(outcomeData)[colNum]
  ## number of the column cnum in hospDF
  cnum <- which(colnames(hospDF)==cname)
  ## a vector of indices in hospDF where Rate == tgtRate  
  indexPos <- which(hospDF[,cnum]==tgtRate)
  ## observations at positions defined in the vector indexPos
  minedData <- hospDF[indexPos, ]
  ## filer hospital names and sort it
  hospVect <- sort(minedData$Hospital.Name)
  ## print first element of hospVect
  print(hospVect[1])
}