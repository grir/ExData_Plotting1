#Load data:
allData <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")

#Convert required vars to date and time:
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y", tz="UTC")
allData$Time <- strptime(allData$Time, format="%H:%M:%S", tz="UTC")

#Subset to our region
myData <- allData[(allData$Date >= as.Date("2007-02-01", format="%Y-%m-%d")) & 
                  (allData$Date <= as.Date("2007-02-02", format="%Y-%m-%d")),  ]


#Plot required charts:

png("plot4.png")
par(mfrow=c(2,2))
#1 the same as plot 2
plot(myData$Global_active_power ,type="l" , xaxt="n", 
     xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(0,nrow(myData) %/% 2,nrow(myData)), 
     labels=weekdays(c(myData$Date[1], myData$Date[nrow(myData) %/% 2+1], myData$Date[nrow(myData)] + 1),abbreviate=TRUE))

#2 similar to #1:
plot(myData$Voltage ,type="l" , xaxt="n", 
     xlab="datetime", ylab="Voltage")
axis(1, at=c(0,nrow(myData) %/% 2,nrow(myData)), 
     labels=weekdays(c(myData$Date[1], myData$Date[nrow(myData) %/% 2+1], myData$Date[nrow(myData)] + 1),abbreviate=TRUE))

#3 the same as plot 3:
plot(myData$Sub_metering_1 ,type="l" , xaxt="n", 
     xlab="", ylab="Energy sub melting")
lines(myData$Sub_metering_2 , col="red")
lines(myData$Sub_metering_3 , col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_melting_1", "Sub_melting_2","Sub_melting_3"))

axis(1, at=c(0,nrow(myData) %/% 2,nrow(myData)), 
     labels=weekdays(c(myData$Date[1], myData$Date[nrow(myData) %/% 2+1], myData$Date[nrow(myData)] + 1),abbreviate=TRUE))

#4 similar to plot 2:
plot(myData$Global_reactive_power ,type="l" , xaxt="n", 
     xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(0,nrow(myData) %/% 2,nrow(myData)), 
     labels=weekdays(c(myData$Date[1], myData$Date[nrow(myData) %/% 2+1], myData$Date[nrow(myData)] + 1),abbreviate=TRUE))


dev.off()

