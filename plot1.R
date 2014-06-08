## read in complete text file
hpc <- read.csv("C:/Users/Dad/Dropbox/DataScienceCoursera/household_power_consumption.txt", sep=";", stringsAsFactors=F)

## subsets necessary rows for February 1 and 2, 2007
newdata <- hpc[66637:69517,]

## creates histogram
hist(as.numeric(newdata$Global_active_power), xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

## writes histogram to png device
dev.copy(png, file = "plot1.png")
dev.off()