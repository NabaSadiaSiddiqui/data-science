getData <- function() {
  if(!file.exists("data")) {
    dir.create("data")
  }
  setwd("./data")
  downloadFile()
  dat <- loadData()
  fdat <- formatData(dat)
  sdata <- extractAndCleanData(fdat)
  setwd("../")
  return(sdata)
}

# Download file from the cloud
downloadFile <- function() {
  destUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  tmpFile <- "out.zip"
  download.file(url=destUrl, destfile=tmpFile, mode="wb", method="curl")
  unzip(tmpFile)
  unlink(tmpFile)
}

# Load data from downloaded file to a variable
loadData <- function() {
  file <- dir()
  dat <- read.table(file, header = TRUE, sep = ";", na.strings="?")
  return(dat)
}

# Format date column of the data set to data class
# Create a new column which concatenates date and time to one object
formatData <- function(tgtData) {
  tgtData$Date <- as.Date(tgtData$Date, format="%d/%m/%Y")
  x <- paste(tgtData$Date, tgtData$Time)
  Date_Time <- strptime(x, format="%Y-%m-%d %H:%M:%S", tz="")
  data <- cbind(tgtData, Date_Time)
  return(data)
}

# Subset tgtData to only include values where 2007-02-01 <= Data <= 2007-02-02
# Clean data to remove NA values
extractAndCleanData <- function(tgtData) {
  destData <- subset(tgtData, tgtData$Date=="2007-02-01" | tgtData$Date=="2007-02-02" )
  destData <- na.omit(destData)
  return(destData)
}