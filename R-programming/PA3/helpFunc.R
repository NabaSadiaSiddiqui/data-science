## checkOutcome takes a character vector outcome and returns the corresponding
## column number in the data frame read from outcome-of-care-measures.csv file
## Return value upon error is 0
checkOutcome <- function(outcome) {
  colNum <- 0   # colNum = 0 is default and signals an error -> outcome is not valid
  if(outcome == "heart attack") {
    colNum <- 11
  }
  else if(outcome == "heart failure") {
    colNum <- 17
  }
  else if(outcome == "pneumonia") {
    colNum <- 23
  }
  colNum
}

## checkState takes a data frame and a character vector state
## It checks if state matches any of the values of the fields in the column
## State of the data frame df
## Returns True if state is valid (in df$State); otherwise False
checkState <- function(df, state) {
  statesVect <- unique(df$State)
  
  state %in% statesVect   ## evaluates to TRUE if state is in statesVect
}

## checkRank takes a data frame of all valid hospitals and a rank num
## It checks if the rank is higher than the total number of hospitals in the state
## Returns TRUE if rank num is within limit -> less than or equal to total num of hospitals
## Returns FALSE otherwise
checkRank <- function(df, num) {
  if(is.na(as.numeric(num))) {  # num == best or worst
    return(TRUE)
  }
  
  return(num <= nrow(df))   ## compute if num is less than or equal to the total number of hospitals
}

## getHospitals returns a subset of df of all hospitals in state
## based on the column number cnum of the data frame df
## it removes all NA observations
## The data frame which is returned contains 3 columns: State, Rate and Hospital Name
getHospitals <- function(df, cnum, state) {
  ## use subset of the data frame
  df[, cnum] <- as.numeric(df[, cnum])
  cname <- colnames(df)[cnum]
  targetData <- subset(df, select=c("State", cname, "Hospital.Name"))
  
  ## get all possible valid candidates from targetData based on the value of the field State
  minedData <- subset(targetData, targetData$State == state & !is.na(targetData[cname]))  
}