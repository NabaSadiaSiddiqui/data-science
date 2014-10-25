# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: helper.R
#
# Description: Download and read National Emission Inventory dataset file from the cloud
#              Clean the data set and return it
#              It defines helper functions which are used in the various R source files
#              that actually do the plotting
#
# Usage: dat <- ReadNEIData() or dat <- ReadSCCData()
#
# Functions:
#         DownloadAndExtractSource() - Download the file from the cloud and extract it
#         ReadData() - Read the data from extracted file and store it 
#                              in a data set
#
#########################################################################################
#
# Function Name: DownloadAndExtractSource
# Description: Download the file from internet to the folder data in the working
#              directory and extract the archived file
# Arguments: None
# Usage: path <- DownloadSource()
# Return: String representation of downloaded file location
#         Returns "ERROR" if download failed
DownloadAndExtractSource <- function() {
  setwd("../")
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  archiveFile <- "NEI_data.zip"
  fileDir <- "data"
  if(!file.exists(fileDir)) {
    dir.create(fileDir)
  }
  workingDir <- paste(getwd(), fileDir, sep="/")
  setwd(workingDir)
  filePath <- paste(getwd(), archiveFile, sep="/")
  download.file(fileURL, destfile=archiveFile, method="curl", mode="wb")
  if(!file.exists(filePath)) {
    workingDir <- "ERROR"
  } else {
    unzip(filePath)
  }
  setwd("../src")
  return(workingDir)
}
#
# Function Name: ReadNEIData
# Description: Read R data from the directory "store" pertaining NEI
#              (National Emissions Inventory)
# Arguments: None
# Usage: obj <- ReadNEIData()
# Return: R data objects as a data frame
ReadNEIData <- function() {
  path <- DownloadAndExtractSource()
  NEI <- NULL
  if(path != "ERROR") {
    NEI <- readRDS("../data/summarySCC_PM25.rds")
  }
  return(NEI)
}
#
# Function Name: ReadSCCData
# Description: Read R data from the directory "store" pertaining SCC
#              (Source Classification Code)
# Arguments: None
# Usage: obj <- ReadSCCData()
# Return: R data objects as a data frame
ReadSCCData <- function() {
  path <- DownloadAndExtractSource()
  SCC <- NULL
  if(path != "ERROR") {
    SCC <- readRDS("../data/Source_Classification_Code.rds")
  }
  return(SCC)
}