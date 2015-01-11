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
# convert the Date and Time variables to Date/Time classes in R
x = paste (data$Date, data$Time)
data$DateTime = strptime (x, "%d/%m/%Y %H:%M:%S")
png ("plot4.png", width = 480, height = 480, units = "px")
par (mfrow = c (2, 2))
with (data, {
        plot (DateTime, Global_active_power, type = "l", xlab = "",
              ylab = "Global Active Power")
        plot (DateTime, Voltage, type = "l", xlab = "datetime",
              ylab = "Global Active Power")
        plot (DateTime, Sub_metering_1, type = "l", xlab = "",
              ylab = "Energy Sub Metering")
        lines (DateTime, Sub_metering_2, type = "l", col = "red")
        lines (DateTime, Sub_metering_3, type = "l", col = "blue")
        legend ("topright", col = c ("black", "red", "blue"),
                legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                bty = "n", lwd = 1)
        plot (DateTime, Global_reactive_power, type = "l", xlab = "datetime",
              ylab = "Global_reactive_power")
        dev.off()      
})
