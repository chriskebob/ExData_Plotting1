filename <- "household_power_consumption.txt"

powerdata <- read.table(filename, header=TRUE, sep=";", na.strings="?",
                        colClasses = c('character', 'character', 'numeric',
                                       'numeric', 'numeric', 'numeric',
                                       'numeric', 'numeric', 'numeric'))
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdatarange <- subset(powerdata, Date == as.Date("2007-02-01") | 
                                 Date == as.Date("2007-02-02"))
powerdatarange$datetime<-as.POSIXct(paste(powerdatarange$Date, 
                                          powerdatarange$Time), 
                                    format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480, units="px", bg="transparent")

par(mfrow = c(2, 2))

plot(powerdatarange$datetime, powerdatarange$Global_active_power, 
     type = "n", xlab = "", ylab = "Global Active Power")
lines(powerdatarange$datetime, powerdatarange$Global_active_power)

plot(powerdatarange$datetime, powerdatarange$Voltage,
     type = "n", xlab = "datetime", ylab = "Voltage")
lines(powerdatarange$datetime, powerdatarange$Voltage)

plot(powerdatarange$datetime, powerdatarange$Sub_metering_1, 
     type = "n", 
     xlab = "",
     ylab = "Energy sub metering")
lines(powerdatarange$datetime, powerdatarange$Sub_metering_1, col = "black")
lines(powerdatarange$datetime, powerdatarange$Sub_metering_2, col = "red")
lines(powerdatarange$datetime, powerdatarange$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(powerdatarange$datetime, powerdatarange$Global_reactive_power,
     type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(powerdatarange$datetime, powerdatarange$Global_reactive_power)

dev.off()