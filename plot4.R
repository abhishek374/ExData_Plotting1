powerdata <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE)
powerdata$Date <- as.Date(powerdata$Date,format = "%d/%m/%Y")
powersub <- subset (powerdata, powerdata[,1]<=as.Date("2007-02-02") &  powerdata[,1]>=as.Date("2007-02-01"))

datetime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
#Plot1
plot(datetime,powersub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Plot2
plot(x = datetime,y = as.numeric(powersub$Voltage), type="l", xlab="", ylab="Voltage")
#Plot3
plot(x = datetime,y = as.numeric(powersub$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(x = datetime,y = as.numeric(powersub$Sub_metering_2),col = "red")
lines(x = datetime,y = as.numeric(powersub$Sub_metering_3),col = "blue")
#Plot4
plot(datetime,as.numeric(powersub$Global_reactive_power), type="l", xlab="", ylab="Global_reactive_power (kilowatts)")


dev.off()
