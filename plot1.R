#Exploratory Data Analysis-Project1

#Question 1

library(dplyr)
library(data.table)

#Changed working directory to C:/Users/kumi/Desktop/projectdata

#Read in data from file

hpcDT <-data.table::fread("household_power_consumption.txt",na.strings="?")


#Filter Dates for 2007-02-01 and 2007-02-02
hpcDT.f <-filter(hpcDT,Date=="1/2/2007"|Date=="2/2/2007")



hist(as.numeric(hpcDT.f[,3]),main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")


#Plot histogram on a file device


png(file="plot1.png",width=480,height=480)


hist(as.numeric(hpcDT.f[,3]),main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")


dev.off()


