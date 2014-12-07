data2 <- read.table("household_power_consumption.txt", header=TRUE, sep=c(";"), colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), strip.white=TRUE, na.strings =c("?", ""))
data2$DateTime = strptime( apply( data2[ , c("Date","Time") ], 1, paste, collapse=" "), "%Y-%m-%d %H:%M:%S")
data <- subset(data2, Date =="2007-02-01" | Date =="2007-02-02")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$DateTime,data$Sub_metering_1,type="l", xlab=" ", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()