require(ggplot2)
require(gridExtra)

# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

mydata <- cbind(mydata, DateTime=strptime(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"))
png(file="plot4.png", width=480, height=480)
p1 <- qplot(DateTime, Global_active_power, data=mydata, geom="line")
p2 <- qplot(DateTime, Voltage, data=mydata, geom="line")
p3 <- ggplot(data=mydata, aes(x=DateTime)) +
  geom_line(aes(y=Sub_metering_1, colour="Sub_metering_1")) + 
  geom_line(aes(y=Sub_metering_2, colour="Sub_metering_2")) + 
  geom_line(aes(y=Sub_metering_3, colour="Sub_metering_3")) + 
  theme(legend.position = c(0.8, 0.9), legend.title=element_blank())
p4 <- qplot(DateTime, Global_reactive_power, data=mydata, geom="line")
grid.arrange(p1,p2,p3,p4, ncol=2)
dev.off()