install.packages('data.table')

# set working directory
setwd("D:\SEM 4\Data science\Tutorial")

# load library data.table
library(data.table)



DT<-fread("./household_power_consumption.txt", na.strings="?")

#set date as d:m:y
DT$ strDate<- as.Date(DT$Date, "%d/%m/%Y")

#select data 
DT.filter<-DT[DT$strDate=="2007-02-01" | DT$strDate=="2007-02-02",]
DT.filter$Global_active_power<-as.numeric(DT.filter$Global_active_power)
rm(DT)

#output histogram to PNG
png(filename="plot1.png", width=480, height=480)
hist(DT.filter$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()



#plot2
#set working directory
setwd("D:\SEM 4\Data science\Tutorial")

library(data.table)

## Getting full dataset
DT<-fread("./household_power_consumption.txt", na.strings="?")

DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## Subsetting the data
DT.filter <- subset(DT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#output histogram to PNG
plot(DT.filter$Global_active_power~DT.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()



#Plot3.R
#set working directory
setwd("D:\SEM 4\Data science\Tutorial")

library(data.table)

## Getting full dataset
DT<-fread("./household_power_consumption.txt", na.strings="?")

DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## Subsetting the data
DT.filter <- subset(DT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#plot the graph with legends
with(DT.filter, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

## output histogram to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



#Plot4.R
#set working directory
setwd("D:\SEM 4\Data science\Tutorial")

library(data.table)

## Getting full dataset
DT<-fread("./household_power_consumption.txt", na.strings="?")

DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## Subsetting the data
DT.filter <- subset(DT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT)

## Converting dates
datetime <- paste(as.Date(DT.filter$Date), DT.filter$Time)
DT.filter$Datetime <- as.POSIXct(datetime)

#plot the graph with legends
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(DT.filter, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_Rective_Power",xlab="datetime")
})
## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
