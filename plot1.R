#Exploratory Data Analysis-Project1

#Question 1

library(dplyr)
library(data.table)

#Changed working directory to C:/Users/kumi/Desktop/projectdata

#Read in data from file

hpcDT <-data.table::fread("household_power_consumption.txt",na.strings="?")
dim(hpcDT)
names(hpcDT)
str(hpcDT)

#Avoid printing in scientific notation
hpcDT[,Global_active_power:=lapply(.SD,as.numeric),.SDcols=c("Global_active_power")]

#Convert to numeric
Global_active_power <-as.numeric(hpcDT$Global_active_power)
class(Global_active_power)


#Change Date column to date type
Date <-as.Date(hpcDT$Date,"%d%m%Y")
class(Date)

#Filter Dates for 2007-02-01 and 2007-02-02
hpcDT.f <-filter(hpcDT,(Date>="2007-02-01")&(Date<"2007-02-03"))


na.omit(hpcDT.f$Global_active_power)

#Plot histogram on a file device


png(file="plot1.png",width=480,height=480)

attach(hpcDT.f)

hist(Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red",breaks=c(0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,10.5,11,11.5,12))


detach(hpcDT.f)

dev.off()


