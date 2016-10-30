

##############################
#Code to create the Plot2.png
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
png("plot1.png", width=480, height=480)

plot(hpc.sub$date_time,hpc.sub$Global_active_power,type="l",ylab="Global active power (kilowatts)", xlab="",cex.lab=0.7,cex.axis=0.7)

dev.off() 