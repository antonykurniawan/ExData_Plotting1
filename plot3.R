# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

# Conver date time
mydata <- cbind(mydata, DateTime=strptime(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"))

x <- mydata$DateTime
y1 <- mydata$Sub_metering_1
y2 <- mydata$Sub_metering_2
y3 <- mydata$Sub_metering_3


# Draw plot
png(file="plot3.png", width=480, height=480)
plot(x, y1, type="l", xlab="", ylab="Energy sub metering") 
lines(x, y2, col="red")
lines(x, y3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1),
       col=c("black","red","blue"))
dev.off()