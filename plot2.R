#Exploratory Data Analysis-Project1

#Question 2

library(data.table)
library(dplyr)


#Changed working directory to "C:/Users/kumi/Desktop/projectdata"

#Read in data from file
hpcDT <-data.table::fread("household_power_consumption.txt",na.strings="?")

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

#Check if Global_active_power is numeric
Global_active_power <-hpcDT$Global_active_power
class(Global_active_power)
y<-Global_active_power

hpcDT.Clean2<-hpcDT[complete.cases(hpcDT)]
nrow(hpcDT.Clean2)

hpcDT.Clean2 <-[complete.cases(hpcDT)]

summary(hpcDT.Clean2$Global_active_power)

#Filter Date for 2007-02-01 and 2007-02-02
hpcDT.Clean2<-hpcDT.Clean2[(Date>="2007-02-01")&(Date<="2007-02-02")]


png(file="plot2.png",width=480,height=480)

attach(hpcDT.Clean2)

plot(Global_active_power,type="l",xlim=c(0,96),xlab="",ylim=c(0,8),ylab="Global Active Power(kilowatts)")

detach(hpcDT.Clean2)

dev.off()

#Two days is equivalent to 48 hours which is equivalent to 2880 minutes. Using this as limit for x will make the graph 
#conjested that is why I used xlim to be between 0 and 96.
