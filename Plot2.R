## Load the dataset
power <- read.csv("household_power_consumption.txt",
                  sep = ";", 
                  header = TRUE, 
                  colClasses = c("character", "character", rep("numeric", 7)), 
                  na.strings = "?")

## Use data from the dates 2007-02-01 and 2007-02-02
power$Time <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- power[(power$Date==as.Date("2007-02-01") | power$Date==as.Date("2007-02-02")),]

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot2.png", width=480, height=480)
plot(power$Time, power$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

