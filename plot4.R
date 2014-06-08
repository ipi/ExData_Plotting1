## This R-code creates 4 graphs in one png-file

## assign data from datafile to data-variable
data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"))

## clean data to have just needed lines
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

## unite date & time and change format
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## create plot4.png
png(filename = "plot4.png")

## make configurations to fit 4 plots in one file
par(mfrow = c(2, 2))

## Global active power
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

## Voltage
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

## Submetering
plot(data$DateTime, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "", col = "black")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black","blue", "red"))

## Global reactive power
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

## close the device
dev.off()