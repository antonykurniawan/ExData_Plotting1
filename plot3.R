require(ggplot2)

# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

mydata <- cbind(mydata, DateTime=strptime(paste(mydata$Date, mydata$Time), format="%Y-%m-%d %H:%M:%S"))
png(file="plot3.png", width=480, height=480)
ggplot(data=mydata, aes(x=DateTime)) +
  geom_line(aes(y=Sub_metering_1, colour="Sub_metering_1")) + 
  geom_line(aes(y=Sub_metering_2, colour="Sub_metering_2")) + 
  geom_line(aes(y=Sub_metering_3, colour="Sub_metering_3")) +
  theme(legend.title=element_blank())
dev.off()