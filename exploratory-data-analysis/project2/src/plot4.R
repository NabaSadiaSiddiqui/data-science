# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: plot4.R
#
# Description: This script answers the question of how emissions from coal combustion-
#              related sources have changed from 1999-2008 in the United States
#
# Usage: source("plot4.R")
#
#########################################################################################
#
library("ggplot2")
source("helper.R")

# Read data from the cloud to the respective data frames
NEI <- ReadNEIData()
SCC <- ReadSCCData()
# Determine the SCC id(s) for coal-combustion related sources and save it in sccDF
sources <- as.character(unique(SCC$EI.Sector))
pattern1 <- "coal"
pattern2 <- "comb"
sectors <- intersect(sources[grepl(pattern1, sources, ignore.case=TRUE)], sources[grepl(pattern2, sources, ignore.case=TRUE)])
SCC$SCC <- as.character(SCC$SCC)
sccDF <- vector()
for(sector in sectors) {
  tmp <- subset(SCC, EI.Sector == sector, select = "SCC")
  sccDF <- rbind(sccDF, tmp)
}
# Determine the corresponding indices in NEI data frame
positions <- match(as.vector(sccDF[,1]), NEI$SCC)
targetData <- na.omit(NEI[positions,c(4,6)])
# Calculate total emissions per year for all coal combustion - related sources and save it in sumDF
sumDF <- data.frame()
years <- unique(targetData$year)
for(curr in years) {
  emissionSet <- subset(targetData, targetData$year == curr, select = Emissions)
  total <- sum(emissionSet$Emissions)
  rowDF <- data.frame(as.numeric(curr), total)
  sumDF <- rbind(sumDF, rowDF)
}
colnames(sumDF) <- c("Year", "Emissions")
# Plot the graph to plot4.png using ggplot2 plotting system
if(!file.exists("../plots")) {
  dir.create("../plots")
}
setwd("../plots")
ggplot(sumDF, aes(x = Year, y = Emissions)) + geom_line() + ggtitle("Trend in emissions from coal combustion-related sources\nacross United States from 1999–2008")
ggsave(filename="plot4.png")
setwd("../src")