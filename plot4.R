# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

# Conver date time
mydata <- cbind(mydata, DateTime=strptime(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"))

# Draw plot
png(file="plot4.png", width=480, height=480)

# Set panel for 2x2 graph
par(mfrow=c(2,2))
x <- mydata$DateTime

# plot1
y <- mydata$Global_active_power
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowats)") 

# plot2
y <- mydata$Voltage
plot(x, y, type="l", xlab="datetime", ylab="Voltage") 

# plot3
x <- mydata$DateTime
y1 <- mydata$Sub_metering_1
y2 <- mydata$Sub_metering_2
y3 <- mydata$Sub_metering_3
plot(x, y1, type="l", xlab="", ylab="Energy sub metering") 
lines(x, y2, col="red")
lines(x, y3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), bty = "n",
       col=c("black","red","blue"))

# plot4
y <- mydata$Global_reactive_power
plot(x, y, type="l", xlab="datetime", ylab="Global_reactive_power") 

# Close graph device
dev.off()