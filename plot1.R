#Reading data, assuming the file household_power_consumption.txt is in the
#working directory

File <- file("household_power_consumption.txt")

colNames <- unlist(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))

data <- read.table(text = grep("^[1,2]/2/2007", readLines(File), value = TRUE),
                   col.names = colNames, sep = ";", header = TRUE)

close(File)

#Creating plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")

dev.off()