#Exploratory Data Analysis

#Question 3

library(data.table)
library(dplyr)

#Changed working directory to "C:/Users/kumi/Desktop/projectdata"

#Reading in data from file
hpcDT <-data.table::fread(input="household_power_consumption.txt",na.strings="?")

dim(hpcDT)
str(hpcDT)
any(is.na(hpcDT))

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


hpcDT.Clean<-hpcDT[complete.cases(hpcDT)]
nrow(hpcDT.Clean)

summary(hpcDT.Clean$Sub_metering_1)

summary(hpcDT.Clean$Sub_metering_2)

summary(hpcDT.Clean$Sub_metering_3)


#Filter Date for 2007-02-01 and 2007-02-02
hpcDT.Clean<-hpcDT.Clean[(Date>="2007-02-01")&(Date<="2007-02-02")]


png("plot3.png",width=480,height=480)

attach(hpcDT.Clean)

plot(Sub_metering_1,type="l",xlim=c(2000,2880),xlab="",ylim=c(0,40),ylab="Energy Submetering")
lines(Sub_metering_2,col="red")
lines(Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1))

detach(hpcDT.Clean)

dev.off()


