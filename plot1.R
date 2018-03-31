plot1 <- function() {
  ## download the input zip
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./household_power_consumption.zip")
  ## unzip the archive
  unzip(zipfile = "./household_power_consumption.zip", exdir = ".")
  ## read entire dataset
  allData <- read.csv(file = "./household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
  ## trim to only 2007-02-01 and 2007-02-02
  dat <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]

  ## open the png device
  png(filename = "plot1.png", width = 480, height = 480)

  ## create plot1
  hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
  ## close the png device
  dev.off()
}
