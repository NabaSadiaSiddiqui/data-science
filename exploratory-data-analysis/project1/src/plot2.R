source("loader.R")
# The function getData() is defined in the helper R script "loader.R"
# getData() downloads data from the cloud, saves it to a file, and reads it into a data frame
# It then cleans the data frame to only include values described by the requirements
# getData() then returns the clean data frame
data <- getData()
# Section below is the meat of this script
# It plots the date/time of the readings vs. global active power
plot(data$Date_Time, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file="plot2.png")
dev.off()