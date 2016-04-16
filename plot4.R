#Reading data, assuming that the file household_power_consumption.txt is
#in the working directory.

File <- file("household_power_consumption.txt")
colNames <- unlist(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
data <- read.table(text = grep("^[1,2]/2/2007", readLines(File), value = TRUE), col.names = colNames, sep = ";", header = TRUE)
close(File)

#Creating a new variable time that combines the original Date & Time variables
data$time <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")


#Plot 4
png(filename = "plot4.png", height = 480, width = 480, units = "px")

par(mfrow = c(2,2))
with(data, {
  plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  plot(time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  plot(time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(time, Sub_metering_2, col = "red")
  lines(time, Sub_metering_3, col = "blue")
  legend("topright", bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
  
  plot(time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()

