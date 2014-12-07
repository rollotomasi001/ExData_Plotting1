data2 <- read.table("household_power_consumption.txt", header=TRUE, sep=c(";"), colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), strip.white=TRUE, na.strings =c("?", ""))
data2$DateTime = strptime( apply( data2[ , c("Date","Time") ], 1, paste, collapse=" "), "%Y-%m-%d %H:%M:%S")
data <- subset(data2, Date =="2007-02-01" | Date =="2007-02-02")

png(filename = "plot2.png", width = 480, height = 480)

plot(data$DateTime,data$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")

dev.off()