## This R-code creates a plot with three lines of sub metering

## assign data from datafile to data-variable
data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"))

## clean data to have just needed lines
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

## unite date & time and change format
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## create plot3.png
png(filename = "plot3.png")

## create a plot with sub metering 1 as black line
plot(data$DateTime, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "black")

## create an extra line with sub_metering_2
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")

## create an extra line with sub_metering_3
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")

## create a legend to the topright
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black","blue", "red"))

## close the device
dev.off()