# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

# Conver date time
mydata <- cbind(mydata, DateTime=strptime(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"))

# Draw plot
png(file="plot2.png", width=480, height=480)
x <- mydata$DateTime
y <- mydata$Global_active_power
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowats)") 
dev.off()