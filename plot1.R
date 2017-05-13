# Course Project 1
# plot 1: hist
setwd("C:/Users/Kyuu/Desktop/Coursera  - Data Science/Course 4/Week 1")
mydata = read.csv2(file = "household_power_consumption.txt", sep = ";", header = T, 
                   na.strings = "?" , stringsAsFactors = F)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata_by_date <- subset(mydata, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
mydata_by_date$datetime <- paste(mydata_by_date$Date, mydata_by_date$Time)
# head(mydata_by_date)
hist(as.numeric(mydata_by_date$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowattts)")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
