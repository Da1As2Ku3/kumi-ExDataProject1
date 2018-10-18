#Exploratory Data Analysis-Project1

#Question 4

#Changed working directory to "C:/Users/kumi/Desktop/projectdata"

library(data.table)
library(dplyr)

#Read in data from file

hpcDT <-data.table::fread(input="household_power_consumption.txt",na.strings="?")

dim(hpcDT)
names(hpcDT)
str(hpcDT)

#Proportion of NAs
sum(is.na(hpcDT))
mean(is.na(hpcDT))

colSums(is.na(hpcDT))

#Avoid printing in scientific notation
hpcDT[,Global_active_power:=lapply(.SD,as.numeric),.SDcols=c("Global_active_power")]

#Change Date column to date type
Date<-hpcDT$Date
Date <-as.Date(hpcDT$Date,"%d%m%Y")
class(Date)
x<-Date

#Check if Global_active_power is numeric
Global_active_power <-hpcDT$Global_active_power
class(Global_active_power)
y<-Global_active_power

#Check if Sub_metering_1 is numeric
Sub_metering_1 <-hpcDT$Sub_metering_1
class(Sub_metering_1)
y1<-Sub_metering_1

#Check if Sub_metering_2 is numeric
Sub_metering_2 <-hpcDT$Sub_metering_2
class(Sub_metering_2)
y2<-Sub_metering_2

#Check if Sub_metering_3 is numeric
Sub_metering_3 <-hpcDT$Sub_metering_3
class(Sub_metering_3)
y3<-Sub_metering_3

#Check if Voltage is numeric
Voltage <-hpcDT$Voltage
class(Voltage)

#Check if Global_reactive_power is numeric
Global_reactive_power <-hpcDT$Global_reactive_power
class(Global_reactive_power)

hpcDT.Clean<-hpcDT[complete.cases(hpcDT),]
nrow(hpcDT.Clean)

any(is.na(hpcDT.Clean))

#Filter Dates for 2007-02-01 and 2007-02-02
hpcDT.Clean <-filter(hpcDT,(Date>="2007-02-01")&(Date<="2007-02-02"))


png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

attach(hpcDT.Clean)

#Plot 1
plot(Global_active_power,type="l",xlim=c(0,96),xlab="",ylim=c(0,8),ylab="Global Active Power(kilowatts)")

#Plot 2
plot(Voltage,type="l",xlim=c(0,2880),xlab="Date",ylab="Voltage")

#Plot 3
plot(Sub_metering_1,type="l",xlim=c(2000,2880),xlab="",ylim=c(0,40),ylab="Energy Submetering")
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1))

#Plot 4
plot(Global_reactive_power,type="l",xlim=c(0,2880),xlab="Date",ylim=c(0,0.8),ylab="Global_reactive_power")

detach(hpcDT.Clean)

dev.off()


