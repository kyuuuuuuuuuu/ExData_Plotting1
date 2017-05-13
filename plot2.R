# Course Project 1
# plot 2
setwd("C:/Users/Kyuu/Desktop/Coursera  - Data Science/Course 4/Week 1")
mydata = read.csv2(file = "household_power_consumption.txt", sep = ";", header = T, 
                   na.strings = "?" , stringsAsFactors = F)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata_by_date <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
mydata_by_date$datetime <- paste(mydata_by_date$Date, mydata_by_date$Time)
mydata_by_date$datetime <- as.POSIXct(mydata_by_date$datetime)
mydata_by_date$Global_active_power <- as.numeric(mydata_by_date$Global_active_power)

plot(mydata_by_date$Global_active_power ~ mydata_by_date$datetime, type = "l",
     ylab = "Global Active Power(kilowattts)", xlab = "")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
