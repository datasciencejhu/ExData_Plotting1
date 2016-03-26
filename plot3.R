plot3 <- function() {
  
  ## Reading the entire data for now. Needs to be modified
  housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  housedata$datetime <- strptime(paste(housedata$Date, housedata$Time), "%d/%m/%Y %H:%M:%S")
  
  ## subset of the entire data that gives data from the dates 2007-02-01 and 2007-02-02
  reqdata <- subset(housedata, housedata$datetime %between% c("2007-02-01 00:00:00", "2007-02-02 23:59:00"))
  
  ## Removing housedata from memory since it's a huge data
  rm(housedata)
  
  png(file="plot3.png")
  with(reqdata, plot(datetime, Sub_metering_1, ylim=range(Sub_metering_1, Sub_metering_2, Sub_metering_3), type="n", ylab="Energy sub metering", xlab=""))
  with(reqdata, lines(datetime, Sub_metering_1, type="l", col='black'))
  with(reqdata, lines(datetime, Sub_metering_2, type="l", col='red'))
  with(reqdata, lines(datetime, Sub_metering_3, type="l", col='blue'))
  legend("topright", pch="__", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
  
}

