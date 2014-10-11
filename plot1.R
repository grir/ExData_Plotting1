#load data:
allData <- read.csv("household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")
#convert to date and time:
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y", tz="UTC")
allData$Time <- strptime(allData$Time, format="%H:%M:%S", tz="UTC")
#subset to our region
myData <- allData[(allData$Date >= as.Date("2007-02-01", format="%Y-%m-%d")) & 
                  (allData$Date <= as.Date("2007-02-02", format="%Y-%m-%d")),  ]


png("plot1.png")
hist(myData$Global_active_power, main = "Global Active Power", 
         xlab="Global Active Power (kilowatts)", col="RED", ylim=c(0,1200))

dev.off()

