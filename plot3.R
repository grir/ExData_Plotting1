#load data:
allData <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")
#convert to date and time:
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y", tz="UTC")
allData$Time <- strptime(allData$Time, format="%H:%M:%S", tz="UTC")
#subset to our region
myData <- allData[(allData$Date >= as.Date("2007-02-01", format="%Y-%m-%d")) & 
                  (allData$Date <= as.Date("2007-02-02", format="%Y-%m-%d")),  ]


png("plot3.png")

plot(myData$Sub_metering_1 ,type="l" , xaxt="n", 
      xlab="", ylab="Energy sub melting")
lines(myData$Sub_metering_2 , col="red")
lines(myData$Sub_metering_3 , col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
          legend = c("Sub_melting_1", "Sub_melting_2","Sub_melting_3"))

axis(1, at=c(0,nrow(myData) %/% 2,nrow(myData)), 
     labels=weekdays(c(myData$Date[1], myData$Date[nrow(myData) %/% 2+1], myData$Date[nrow(myData)] + 1),abbreviate=TRUE))

dev.off()

