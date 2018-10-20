#Exploratory Data Analysis-Project1

#Question 4

#Changed working directory to "C:/Users/kumi/Desktop/projectdata"

library(data.table)
library(dplyr)

#Read in data from file

hpcDT <-data.table::fread(input="household_power_consumption.txt",na.strings="?")


#Filter Dates for 2007-02-01 and 2007-02-02
hpcDT.f <-filter(hpcDT,Date=="1/2/2007"|Date=="2/2/2007")

#Use strptime on Dates and Time to convert them to date objects and time objects

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

#Plot 1
plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Global_active_power),type="l",xlab="", ylab = "Global Active Power(kilowatts)")

#Plot 2
plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Voltage),type="l",xlab="dateTime",ylab="Voltage")

#Plot 3
plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_1),type="l",xlab="",ylim=c(0,40),ylab = "Energy sub metering",col="black")
lines(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_2,ylim=c(0,30),col="red"))
lines(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Sub_metering_3,ylim=c(0,30),col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1))

#Plot 4
plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Global_reactive_power),type="l",xlab="dateTime",ylim=c(0,0.8),ylab="Global_reactive_power")

dev.off()


