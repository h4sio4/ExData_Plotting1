#Reading data, assuming the file household_power_consumption.txt is in the
#working directory

File <- file("household_power_consumption.txt")
colNames <- unlist(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
data <- read.table(text = grep("^[1,2]/2/2007", readLines(File), value = TRUE), col.names = colNames, sep = ";", header = TRUE)
close(File)

#Combining date/time data into a single time variable
data$time <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")

#Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(data, plot(time, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(data, lines(time, Sub_metering_2, col = "red"))
with(data, lines(time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)
dev.off()