# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: plot2.R
#
# Description: This script answers the question of whether total emissions
#              from PM2.5 in the Baltimore City, Maryland, has decreased from 1999 to 2008
#              It uses helper functions defined in helper.R to load data into a data frame object
#              Cleans and summarizes total emissions per year
#              Creates a plot showing the total PM2.5 emission from all sources for each of the years
#              1999, 2002, 2005, and 2008 and saves it as plot2.png
#
# Usage: source("plot2.R")
#
#########################################################################################
#

source("helper.R")
# Load data from cloud and store it in the data frame data
data <- ReadNEIData()
# Subset data pertaining to Baltimore City only
baltimore <- subset(data, data$fips == "24510")
# Sum emissions per year and save it in the data frame sumDF
sumDF <- data.frame()
years <- unique(baltimore$year)
for(curr in years) {
  emissions <- subset(baltimore, baltimore$year == curr, select = Emissions)
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
png("plot2.png")
plot(sumDF$Year, sumDF$Emissions, type="l", xlab="Year", ylab="Emissions (tons)", main=expression("Trend in total PM"[2.5]*" emissions in the Baltimore City from 1999-2008"))
dev.off()
setwd("../src")