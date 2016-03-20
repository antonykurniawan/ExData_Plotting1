mydata <- read.table(file = "../household_power_consumption.txt",
                   sep = ";",
                   header = TRUE)

png(file="plot1.png", width=480, height=480)
plot(x=rnorm(10),y=rnorm(10),main="example")
dev.off()
