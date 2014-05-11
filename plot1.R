## Download data from:
## https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption.
## Unzip it to a text file named "household_power_consumption.txt".

##Open the data in R, creating dataset named "raw"
raw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
          na.strings = "?")

##Convert the Date and Time variables to a date/time variable named x
raw$Date <- as.Date(raw$Date, format = "%d/%m/%Y")
raw$x <- paste(raw$Date, raw$Time)
raw$x <- strptime(raw$x, "%Y-%m-%d %H:%M:%S")

##Save the data from the February 1st and 2nd of 2007 to dataset "raw2"
st <- as.POSIXct("2007-02-01 00:00:00")
en <- as.POSIXct("2007-02-02 23:59:59")
raw2 <- raw[raw$x > st & raw$x < en, ]

##Create Plot 1
hist(raw2$Global_active_power, col = "orangered", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()