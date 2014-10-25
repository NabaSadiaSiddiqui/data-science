source("loader.R")
# The function getData() is defined in the helper R script "loader.R"
# getData() downloads data from the cloud, saves it to a file, and reads it into a data frame
# It then cleans the data frame to only include values described by the requirements
# getData() then returns the clean data frame
data <- getData()
# Section below is the meat of this script
# It plots the date/time of the readings vs. energy sub metering values
png(filename="plot3.png")
plot(data$Date_Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(data$Date_Time, data$Sub_metering_2, type="l", col="red" )
lines(data$Date_Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1, 1, 1))
dev.off()