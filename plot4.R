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

## prepare for 2 by 2 graph
par(mfrow = c(2,2))

## Upper left graph
## add Global Active Power to graph
hist(as.numeric(newdata$Global_active_power), xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

## Upper right graph
plot(newtime, as.numeric(newdata$Voltage), xlab="datetime", ylab="Voltage", type = 's')

## add Energy sub meters 1:3 to graph
plot(newtime, as.numeric(newdata$Sub_metering_1), xlab="", ylab="Energy sub metering", type = 's')
lines(newtime, as.numeric(newdata$Sub_metering_2), xlab="", ylab="Energy sub metering", col='red', type = 's')
lines(newtime, as.numeric(newdata$Sub_metering_3), xlab="", ylab="Energy sub metering", col='blue', type = 's')
legend("topright", col = c("black", "blue", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, px.cex=1, cex=0.2)

## Lower right graph
plot(newtime, as.numeric(newdata$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power", type = 's')

## writes histogram to png device
dev.copy(png, file = "plot4.png", res=55)
dev.off()