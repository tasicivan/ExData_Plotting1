## Check your working directory.
getwd()

## Download zip file, unzip it and close the link.
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"))
unlink(temp)

## Record when the data was downloaded.
dateDownloaded <- date()
dateDownloaded

## Read the data, specifying that separator is semicolon, data has column names in first row, and missing values are recored as question marks.
data <- read.table("C:\\Coursera\\household_power_consumption.txt", sep = ";", header = TRUE, quote="", na.strings = "?")

## Check the data, high level.
str(data)

## Subset the data using only 2 days, February 1st and Feburary 2nd 2007.
electricdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Create a DateTime variable from Date and Time vars provided.
electricdata$DateTime <- strptime(paste(electricdata$Date, electricdata$Time), "%d/%m/%Y %H:%M:%S")

##Plot 3

## Reset output screen settings for one graph.
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))

## Create a scatter plot.
yrange<-range(c(electricdata$Sub_metering_1, electricdata$Sub_metering_2, electricdata$Sub_metering_3))
plot(electricdata$DateTime, electricdata$Sub_metering_1, type = "l", ylim = yrange, col=1, xlab = "", ylab="Energy sub meetering")
lines(electricdata$DateTime, electricdata$Sub_metering_2,type = "l", col = 2)
lines(electricdata$DateTime, electricdata$Sub_metering_3,type = "l", col = 4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"))

## Copy my plot from screen to a PNG file.
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()

## Just in case, inform the user where the file is.
paste("Your file plot3.png is in ", getwd())
