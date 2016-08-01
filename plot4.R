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

## Plot 4

## Reset output screen settings for one graph.
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))

## Set up outline (i.e., number and distribution of graphs), margins, and outer margins.
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

## Create first scatter plot.
plot(electricdata$DateTime, electricdata$Global_active_power, type="l", xlab = "", ylab="Global Active Power")

## Create second scatter plot.
plot(electricdata$DateTime, electricdata$Voltage, type="l", xlab = "datetime", ylab="Voltage")

## Create third scatter plot. Need to define the max range of the three data series. Add legend.
yrange<-range(c(electricdata$Sub_metering_1, electricdata$Sub_metering_2, electricdata$Sub_metering_3))
plot(electricdata$DateTime, electricdata$Sub_metering_1, type = "l", ylim = yrange, col=1, xlab = "", ylab="Energy sub meetering")
lines(electricdata$DateTime, electricdata$Sub_metering_2,type = "l", col = 2)
lines(electricdata$DateTime, electricdata$Sub_metering_3,type = "l", col = 4)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.7)

## Create fourth scatter plot.
plot(electricdata$DateTime, electricdata$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")

## I had issues using with(electricdata, ...) function, so I gave up.

## Copy my plot from screen to a PNG file.
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()

## PNG file with 480 by 480 px looks really bad because the legend shrinks. I have another version of the file at 861 by 541 px.
paste("PNG file with 480 by 480 px looks really bad because the legend shrinks. I tried many things to fix it, in the end I provide file plot4_better.png with unrestricted pixels.")

## Just in case, inform the user where the file is.
paste("Your file plot4.png is in ", getwd())
