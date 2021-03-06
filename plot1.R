# read only data from the dates 2007-02-01 and 2007-02-02
# it means reading 2880 rows from the row 66637th
data = read.table ("household_power_consumption.txt",
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", rep("numeric",7)),
                   nrows = 2880,
                   skip = 66637
                   )
# add names of columns
colnames(data) = c("Date", "Time", "Global_active_power","Global_reactive_power",
                    "Voltage", "Global_intensity",
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
png ("plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()