# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: plot5.R
#
# Description: This script answers the question of how emissions from motor vehicle
#               sources have changed from 1999-2008 in the Baltimore City
#
# Usage: source("plot5.R")
#
#########################################################################################
#
library("ggplot2")
source("helper.R")

# Read data from the cloud to the respective data frames
NEI <- ReadNEIData()
SCC <- ReadSCCData()
# Subset Baltimore-related data
county <- subset(NEI, fips == "24510")
# Determine the SCC id for motor vehicle related sources and save it in sccDF
sources <- as.character(unique(SCC$EI.Sector))
pattern1 <- "Mobile"
pattern2 <- "Vehicles"
sectors <- intersect(sources[grepl(pattern1, sources, ignore.case=TRUE)], sources[grepl(pattern2, sources, ignore.case=TRUE)])
SCC$SCC <- as.character(SCC$SCC)
sccDF <- vector()
for(sector in sectors) {
  tmp <- subset(SCC, EI.Sector == sector, select = "SCC")
  sccDF <- rbind(sccDF, tmp)
}
# Determine the corresponding entries in county data frame
positions <- match(as.vector(sccDF[,1]), county$SCC)
targetData <- na.omit(county[positions,c(4,6)])
# Calculate total emissions per year for all motor vehicle sources and save it in sumDF
sumDF <- data.frame()
years <- unique(targetData$year)
for(curr in years) {
  emissionSet <- subset(targetData, targetData$year == curr, select = Emissions)
  total <- sum(emissionSet$Emissions)
  rowDF <- data.frame(as.numeric(curr), total)
  sumDF <- rbind(sumDF, rowDF)
}
colnames(sumDF) <- c("Year", "Emissions")
# Plot the graph to plot5.png using ggplot2 plotting system
if(!file.exists("../plots")) {
  dir.create("../plots")
}
setwd("../plots")
ggplot(sumDF, aes(x = Year, y = Emissions)) + geom_line() + ggtitle("Trend in emissions from motor vehicle sources\nin the Baltimore City from 1999-2008")
ggsave(filename="plot5.png")
setwd("../src")