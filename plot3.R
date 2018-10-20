#Exploratory Data Analysis

#Question 3

library(data.table)
library(dplyr)

#Changed working directory to "C:/Users/kumi/Desktop/projectdata"

#Reading in data from file
hpcDT <-data.table::fread(input="household_power_consumption.txt",na.strings="?")


#Filter Date for 2007-02-01 and 2007-02-02
hpcDT.f<-filter(hpcDT,Date=="1/2/2007"|Date=="2/2/2007")

#Use strptime on Dates and Time to convert them to date objects and time object

plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_1),type="l",xlab="", ylab = "Energy Submetering")


png("plot3.png",width=480,height=480)

plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_1),type="l",xlab="",ylim=c(0,40),ylab = "Energy sub metering",col="black")

lines(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_2,col="red"))

lines(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_3,col="blue"))

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","$Sub_metering_3"),lty=c(1,1),lwd=c(1,1))

dev.off()


