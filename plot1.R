powerdata <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE)
powerdata$Date <- as.Date(powerdata$Date,format = "%d/%m/%Y")
powersub <- subset (powerdata, powerdata[,1]<=as.Date("2007-02-02") &  powerdata[,1]>=as.Date("2007-02-01"))

png("plot1.png", width=480, height=480)
hist(as.numeric(powersub$Global_active_power),main = "Global Active Power",xlab = "Global Active Power (Kilowatts)",ylab = "Frequency", col = "Red")
dev.off()
