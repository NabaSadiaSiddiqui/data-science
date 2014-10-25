source("loader.R")
# The function getData() is defined in the helper R script "loader.R"
# getData() downloads data from the cloud, saves it to a file, and reads it into a data frame
# It then cleans the data frame to only include values described by the requirements
# getData() then returns the clean data frame
data <- getData()
# Section below is the meat of this script
# It creates a histogram, formats it as per the requirements set in the instructions and saves it to a png file
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png, file="plot1.png")
dev.off()