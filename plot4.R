plot4 <- function() {
  
  ## Reading the entire data for now. Needs to be modified
  housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  housedata$datetime <- strptime(paste(housedata$Date, housedata$Time), "%d/%m/%Y %H:%M:%S")
  
  ## subset of the entire data that gives data from the dates 2007-02-01 and 2007-02-02
  reqdata <- subset(housedata, housedata$datetime %between% c("2007-02-01 00:00:00", "2007-02-02 23:59:00"))
  
  ## Removing housedata from memory since it's a huge data
  rm(housedata)
  
  png(file="plot4.png")
  par(mfrow=c(2,2))
  with(reqdata, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
  with(reqdata, plot(datetime, Voltage, type="l", ylab="Voltage"))
  with(reqdata, plot(datetime, Sub_metering_1, ylim=range(Sub_metering_1, Sub_metering_2, Sub_metering_3), type="n", xlab="", ylab="Energy sub metering"))
  with(reqdata, lines(datetime, Sub_metering_1, type="l", col='black'))
  with(reqdata, lines(datetime, Sub_metering_2, type="l", col='red'))
  with(reqdata, lines(datetime, Sub_metering_3, type="l", col='blue'))
  legend("topright", pch="__", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  with(reqdata, plot(datetime, Global_reactive_power, type="l"))
  dev.off()
  
}

