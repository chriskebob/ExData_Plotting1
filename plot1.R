filename <- "household_power_consumption.txt"

powerdata <- read.table(filname, header=TRUE, sep=";", na.strings="?",
                        as.is=TRUE)
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdatarange <- subset(powerdata, Date == as.Date("2007-02-01") | 
                                 Date == as.Date("2007-02-02"))
powerdatarange$datetime<-strptime(paste(data$Date, data$Time), 
                                  "%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480, units="px", bg="transparent")

with (powerdatarange, 
      hist(Global_active_power, breaks=12, col="red", 
           xlab = "Global Active Power (kilowatts)", main="Global Active Power"))

dev.off()