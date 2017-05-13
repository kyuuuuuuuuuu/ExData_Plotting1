# Course Project 1
# plot 3
setwd("C:/Users/Kyuu/Desktop/Coursera  - Data Science/Course 4/Week 1")
mydata = read.csv2(file = "household_power_consumption.txt", sep = ";", header = T, 
                   na.strings = "?" , stringsAsFactors = F)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata_by_date <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
mydata_by_date$datetime <- paste(mydata_by_date$Date, mydata_by_date$Time)
mydata_by_date$datetime <- as.POSIXct(mydata_by_date$datetime)
# mydata_by_date$Global_active_power <- as.numeric(mydata_by_date$Global_active_power)

with(mydata_by_date,
     {
         plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Global Active Power(kilowattts)", xlab = "")
         lines(Sub_metering_2 ~ datetime, col = "red")
         lines(Sub_metering_3 ~ datetime, col = "blue")
         legend("topright", col = c("black", "red", "blue"), lty = 1,
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))         
     })

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
