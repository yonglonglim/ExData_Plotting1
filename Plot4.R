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

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# Plot 1
plot(power$Time, power$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Plot 2
plot(power$Time, power$Voltage, 
     type="l",
     xlab="datetime", 
     ylab="Voltage")

# Plot 3
plot(power$Time, power$Sub_metering_1, 
     type="l", 
     col="black",
     xlab="", 
     ylab="Energy sub metering")
lines(power$Time, power$Sub_metering_2, col="red")
lines(power$Time, power$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)

# Plot 4
plot(power$Time, power$Global_reactive_power, type="n",
     xlab="datetime", 
     ylab="Global_reactive_power")
lines(power$Time, power$Global_reactive_power)

dev.off()
