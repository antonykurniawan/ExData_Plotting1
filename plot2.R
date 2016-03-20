require(ggplot2)

# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

mydata <- cbind(mydata, DateTime=strptime(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"))
png(file="plot2.png", width=480, height=480)
qplot(DateTime, Global_active_power, data=mydata, geom="line")
dev.off()