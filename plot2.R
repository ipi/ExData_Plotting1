## This R-code creates linegraph of Global active power during selected 2 days

## assign data from datafile to data-variable
data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric"))

## clean data to have just needed lines
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

## unite date & time and change format
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## create plot2.png
png(filename = "plot2.png")

## plot DateTime and global active power on a line graph
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## close the device
dev.off()