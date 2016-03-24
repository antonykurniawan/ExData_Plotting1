# Read data from file (only contains records from 1st and 2nd Feb 2007)
mydata <- read.table(file = "household_power_consumption.txt",
                     sep = ";",
                     header = TRUE)

png(file="plot1.png", width=480, height=480)
hist(mydata$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowats)")
dev.off()