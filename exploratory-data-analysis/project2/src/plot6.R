# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: plot6.R
#
# Description: This script compares emissions over time from motor vehicle sources in Baltimore City
#              with emissions over time from motor vehicle sources in Los Angeles County
#
# Usage: source("plot6.R")
#
#########################################################################################
#
library("ggplot2")
source("helper.R")

# Read data from the cloud to the respective data frames
NEI <- ReadNEIData()
SCC <- ReadSCCData()
# Subset data for only Baltimore and LA
baltimore <- "24510"
la <- "06037"
counties <- subset(NEI, fips == baltimore | fips == la)
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
# Determine the corresponding entries in counties data frame
positions <- match(as.vector(sccDF[,1]), counties$SCC)
targetData <- na.omit(counties[positions,c(1, 4,6)])
# Calculate total emissions per year for all motor vehicle sources per county and save it in sumDF
sumDF <- data.frame()
years <- unique(targetData$year)
counties <- c(baltimore, la)
for(county in counties) {  
  for(curr in years) {
    emissionSet <- subset(targetData, targetData$year == curr & targetData$fips == county, select = Emissions)
    total <- sum(emissionSet$Emissions)
    rowDF <- data.frame(county, as.numeric(curr), total)
    sumDF <- rbind(sumDF, rowDF)
  }
}
colnames(sumDF) <- c("County", "Year", "Emissions")
# Split the data frame according to county for plotting
baltimoreDF <- subset(sumDF, County == baltimore, select = c("Year", "Emissions"))
losangelesDF <- subset(sumDF, County == la, select = c("Year", "Emissions"))
# Plot the graph to plot5.png using ggplot2 plotting system
if(!file.exists("../plots")) {
  dir.create("../plots")
}
setwd("../plots")
ggplotObj <- ggplot(,aes(col = "County"))
baltimoreLayer <- geom_line(data = baltimoreDF, aes(x = Year, y = Emissions, col = "Baltimore City"))
losangelesLayer <- geom_line(data = losangelesDF, aes(x = Year, y = Emissions, col = "Los Angeles County"))
title <- ggtitle("Comparison of trend in emissions from motor vehicle sources\nbetween Baltimore City and Los Angeles County from 1999-2008")
ggplotObj + baltimoreLayer + losangelesLayer  + title
ggsave(filename="plot6.png")
setwd("../src")