# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: plot1.R
#
# Description: This script answers the basic question of whether total emissions
#              from PM2.5 in the United States has decreased from 1999 to 2008
#              It uses helper functions defined in helper.R to load data into a data frame object
#              Cleans and summarizes total emissions per year
#              Creates a plot showing the total PM2.5 emission from all sources for each of the years
#              1999, 2002, 2005, and 2008 and saves it as plot1.png
#
# Usage: source("plot1.R")
#
#########################################################################################
#

source("helper.R")
# Read data from the cloud to the data frame data
data <- ReadNEIData()
# Sum emissions per year and save it in the data frame sumDF
sumDF <- data.frame()
years <- unique(data$year)
for(curr in years) {
  emissions <- subset(data, data$year == curr, select = Emissions)
  total <- sum(emissions$Emissions)
  row <- c(curr, total)
  sumDF <- rbind(sumDF, row)
}
colnames(sumDF) <- c("Year", "Emissions")
# Go to plots directory and plot the results using base plotting system
if(!file.exists("../plots")) {
  dir.create("../plots")
}
setwd("../plots")
png("plot1.png")
plot(sumDF$Year, sumDF$Emissions, type="l", xlab="Year", ylab="Emissions (tons)", main=expression("Trend in total PM"[2.5]*" emissions in the United States from 1999-2008"))
dev.off()
setwd("../src")