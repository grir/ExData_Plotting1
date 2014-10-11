#load data:
allData <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")
#convert to date and time:
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y", tz="UTC")
allData$Time <- strptime(allData$Time, format="%H:%M:%S", tz="UTC")
#subset to our region
myData <- allData[(allData$Date >= as.Date("2007-02-01", format="%Y-%m-%d")) & 
                  (allData$Date <= as.Date("2007-02-02", format="%Y-%m-%d")),  ]


png("plot2.png")
plot(myData$Global_active_power ,type="l" , xaxt="n", 
      xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(0,nrow(myData) %/% 2,nrow(myData)), 
     labels=weekdays(c(myData$Date[1], myData$Date[nrow(myData) %/% 2+1], myData$Date[nrow(myData)] + 1),abbreviate=TRUE))

dev.off()

