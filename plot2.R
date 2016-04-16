#Reading data, assuming the file household_power_consumption.txt is in the
#working directory

File <- file("household_power_consumption.txt")

colNames <- unlist(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))

data <- read.table(text = grep("^[1,2]/2/2007", readLines(File), value = TRUE),
                   col.names = colNames, sep = ";", header = TRUE)

close(File)

#Combining date and time to a variable Time
data$time <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(data$time, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()