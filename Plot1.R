## Load the dataset
power <- read.csv("household_power_consumption.txt",sep=";", header=TRUE, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Use data from the dates 2007-02-01 and 2007-02-02
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power <- power[(power$Date==as.Date("2007-02-01") | power$Date==as.Date("2007-02-02")),]
summary(power$Date)

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)
hist(power$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
