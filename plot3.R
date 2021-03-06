

##############################
#Code to create the Plot3.png
##############################


## load Libraries
library(lubridate)
library(dplyr)

#read in the data
hpc <- read.table("household_power_consumption.txt",na.strings="?", header=TRUE, sep=";")

##Change dates as YYY-MM-DD date format
hpc<- mutate(hpc, Date=dmy(Date))

## Create a new variable date_time that contains date and time 
hpc$date_time = ymd_hms(paste(hpc$Date, hpc$Time))

## create a new variabl with the date of the week
hpc$day = wday(hpc$date_time,label = TRUE)

## saved the data from 2007-02-01 and  2007-02-02 days
hpc.sub<-filter(hpc, Date =="2007-02-01" | Date == "2007-02-02") 

## save the plit as png and create an histogram with Global_active_power
png("plot3.png", width=480, height=480)

plot(hpc.sub$date_time,hpc.sub$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",cex.lab=0.7,cex.axis=0.7)  
lines(hpc.sub$date_time,hpc.sub$Sub_metering_1,type="l",col="black")
lines(hpc.sub$date_time,hpc.sub$Sub_metering_2,type="l",col="red")
lines(hpc.sub$date_time,hpc.sub$Sub_metering_3,type="l",col="blue")

legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7 ) 

dev.off() 