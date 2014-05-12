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

##Create Plot 4
png(file = "plot4.png")
par(mfrow = c(2, 2))
with(raw2, {
  plot(raw2$x, raw2$Global_active_power, type = "s", xlab = "", 
       ylab = "Global Active Power")
  plot(raw2$x, raw2$Voltage, type = "s", xlab = "datetime", 
       ylab = "Voltage")
  plot(raw2$x,raw2$Sub_metering_1,type="s",col="black", xlab = "", 
       ylab = "Energy sub metering")
  lines(raw2$x,raw2$Sub_metering_2,col="red")
  lines(raw2$x,raw2$Sub_metering_3,col="blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), cex=0.75, 
         bty = "n", 
         legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
  plot(raw2$x, raw2$Global_reactive_power, type = "s", xlab = "datetime", 
       ylab = "Global_reactive_power")
})
dev.off()
