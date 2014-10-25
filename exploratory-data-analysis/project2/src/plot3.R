# Naba Siddiqui - Coursera - Exploratory Data Analysis
#
# Name: plot3.R
#
# Description: This script answers the question of which of the four types of sources
#              indicated by the type (point, nonpoint, onroad, nonroad) variable has seen
#              decreases and increases in emissions from 1999–2008 for Baltimore City
#
# Usage: source("plot3.R")
#
#########################################################################################
#
library("ggplot2")
source("helper.R")

# Read data from the cloud to the data frame data
data <- ReadNEIData()
# Subset data pertaining to Baltimore City only
county <- subset(data, data$fips == "24510")
# Sum emissions per year per type and save it in the data frame sumDF
sumDF <- data.frame()
years <- unique(data$year)
types <- unique(data$type)
for(src in types) {
  typeSet <- subset(county, county$type == src)
  for(curr in years) {
    emissionSet <- subset(county, county$type == src & county$year == curr, select = Emissions)
    total <- sum(emissionSet$Emissions)
    rowDF <- data.frame(src, curr, total)
    sumDF <- rbind(sumDF, rowDF)
  }
}
colnames(sumDF) <- c("Type", "Year", "Emissions")
# Plot the graph to plot3.png using ggplot2 plotting system
if(!file.exists("../plots")) {
  dir.create("../plots")
}
setwd("../plots")
# Subset data per type to use for plotting
point <- subset(sumDF, sumDF$Type == "POINT", select = c("Year", "Emissions"))
non_point <- subset(sumDF, sumDF$Type == "NONPOINT", select = c("Year", "Emissions"))
on_road <- subset(sumDF, sumDF$Type == "ON-ROAD", select = c("Year", "Emissions"))
non_road <- subset(sumDF, sumDF$Type == "NON-ROAD", select = c("Year", "Emissions"))
# Create plots using ggplot2 plotting system
ggplotObj <- ggplot(sumDF, aes(color = "Types"))
point_layer <- geom_line(data = point, aes(x = Year, y = Emissions, col = "POINT"))
non_point_layer <- geom_line(data = non_point, aes(x = Year, y = Emissions, col = "NONPOINT"))
on_road_layer <- geom_line(data = on_road, aes(x = Year, y = Emissions, col = "ON-ROAD"))
non_road_layer <- geom_line(data = non_road, aes(x = Year, y = Emissions, col = "NON-ROAD"))
ggplotObj + point_layer + non_point_layer + on_road_layer + non_road_layer + ggtitle("Trend in emissions by sources from 1999-2008 in the Baltimore City")
ggsave(filename="plot3.png")
setwd("../src")