plot4 <- function() {
  ## download the input zip
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.zip")
  ## unzip the archive
  unzip(zipfile = "./household_power_consumption.zip", exdir = ".")
  ## read entire dataset
  allData <- read.csv(file = "./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
  ## trim to only 2007-02-01 and 2007-02-02
  dat <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]

  ## open the png device
  png(filename = "plot4.png", width = 480, height = 480)

  ## create plot4
  par(mfrow=c(2,2))
  # top-left
  plot(strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  # top-right
  plot(strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  # bottom-left
  plot(strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(x = strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), y = dat$Sub_metering_2, col = "red")
  lines(x = strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), y = dat$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")
  # bottom-right
  plot(strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  ## close the png device
  dev.off()
}