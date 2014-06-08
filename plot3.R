## read in complete text file
hpc <- read.csv("C:/Users/Dad/Dropbox/DataScienceCoursera/household_power_consumption.txt", sep=";", stringsAsFactors=F)

## subsets necessary rows for February 1 and 2, 2007
newdata <- hpc[66637:69517,]

## subset the date and time columns
datetime <- subset(newdata[,1:2])

## create a large character vector
combined <- paste(datetime$Date, datetime$Time)

## convert the vector to class time object
newtime <- strptime(combined, format="%d/%m/%Y %H:%M:%S")

## plot date vs. Sub_metering_1
plot(newtime, as.numeric(newdata$Sub_metering_1), xlab="", ylab="Energy sub metering", type = 's')

## add Sub_metering_2
lines(newtime, as.numeric(newdata$Sub_metering_2), xlab="", ylab="Energy sub metering", col='red', type = 's')

## add Sub_metering_3
lines(newtime, as.numeric(newdata$Sub_metering_3), xlab="", ylab="Energy sub metering", col='blue', type = 's')

## add legend
legend("topright", col = c("black", "blue", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, pt.cex=1,cex=0.6)

## write plot to png device
dev.copy(png, file = "plot3.png", res=55)
dev.off()