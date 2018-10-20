#Exploratory Data Analysis-Project1

#Question 2

library(data.table)
library(dplyr)


#Changed working directory to "C:/Users/kumi/Desktop/projectdata"

#Read in data from file
hpcDT <-data.table::fread("household_power_consumption.txt",na.strings="?")


#Filter Date for 2007-02-01 and 2007-02-02
hpcDT.f<-filter(hpcDT,Date=="1/2/2007"|Date=="2/2/2007")

#Use strptime on Dates and Time to convert them to date objects and time objects

png(file="plot2.png",width=480,height=480)

plot(strptime(paste(hpcDT.f$Date,hpcDT.f$Time,sep=" "), format = "%d/%m/%Y %H:%M:%S"),as.numeric(hpcDT.f$Global_active_power),type="l",xlab="", ylab = "Global Active Power(kilowatts)")


dev.off()

