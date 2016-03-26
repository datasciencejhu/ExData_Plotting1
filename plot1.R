plot1 <- function() {
  
  ## Reading the entire data for now. Needs to be modified
  housedata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  housedata$datetime <- strptime(paste(housedata$Date, housedata$Time), "%d/%m/%Y %H:%M:%S")
  
  ## subset of the entire data that gives data from the dates 2007-02-01 and 2007-02-02
  reqdata <- subset(housedata, housedata$datetime %between% c("2007-02-01 00:00:00", "2007-02-02 23:59:00"))
  
  ## Removing housedata from memory since it's a huge data
  rm(housedata)
  
  png(file="plot1.png")
  with(reqdata, hist(Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red"))
  dev.off()
  
}

