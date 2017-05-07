powerdata <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE)
powerdata$Date <- as.Date(powerdata$Date,format = "%d/%m/%Y")
powersub <- subset (powerdata, powerdata[,1]<=as.Date("2007-02-02") &  powerdata[,1]>=as.Date("2007-02-01"))

datetime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%Y-%m-%d %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(datetime,powersub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
