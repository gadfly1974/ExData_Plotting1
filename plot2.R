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

## plot date vs. kilowatts
plot(newtime, as.numeric(newdata$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)", type = 's')

## write plot to png device
dev.copy(png, file = "plot2.png")
dev.off()
