## this R-file creates png-file with histogram of 
## Global Active Power from two days in February 2007


## assign data from datafile to data-variable
data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?",
         colClasses = c("character", "character", "numeric", "numeric", "numeric",
                        "numeric", "numeric", "numeric", "numeric"))

## clean data to have just needed lines
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]

## change Date variable to date-format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## create a png-file to store the plot1
png(filename = "plot1.png")

## create histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## close png-graphic device
dev.off()