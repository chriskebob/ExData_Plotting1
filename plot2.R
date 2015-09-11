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

png("plot2.png", width=480, height=480, units="px", bg="transparent")

plot(powerdatarange$datetime, powerdatarange$Global_active_power, 
     type = "n", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
lines(powerdatarange$datetime, powerdatarange$Global_active_power)

dev.off()