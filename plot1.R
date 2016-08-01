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

## Plot 1

## Reset output screen settings for one graph.
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))

## Create histogram.
hist(electricdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## Copy my plot from screen to a PNG file.
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()

## Just in case, inform the user where the file is.
paste("Your file plot1.png is in ", getwd())
