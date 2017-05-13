# Course Project 1
# plot 4
setwd("C:/Users/Kyuu/Desktop/Coursera  - Data Science/Course 4/Week 1")
mydata = read.csv2(file = "household_power_consumption.txt", sep = ";", header = T, 
                   na.strings = "?" , stringsAsFactors = F)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata_by_date <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
mydata_by_date$datetime <- paste(mydata_by_date$Date, mydata_by_date$Time)
mydata_by_date$datetime <- as.POSIXct(mydata_by_date$datetime)
# mydata_by_date$Global_active_power <- as.numeric(mydata_by_date$Global_active_power)
par(mfrow = c(2, 2))
with(mydata_by_date,
     {
         # plot1
         plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", xlab = "")
         # plot2
         plot(Voltage ~ datetime, type = "l", ylab = "Voltage")
         # plot3
         plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
         lines(Sub_metering_2 ~ datetime, col = "red")
         lines(Sub_metering_3 ~ datetime, col = "blue")
         legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))       
         # plot4
         plot(Global_reactive_power ~ datetime, type = "l")
     })

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
