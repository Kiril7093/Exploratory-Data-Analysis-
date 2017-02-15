#Creating a working directory:
if(!file.exists("./data")){dir.create("./data")}

# Unzip "exdata_data_household_power_consumption" into working directory:
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")

# Reading the data:
householdData <- "./data/household_power_consumption.txt"
data <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
relevantData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot data:
datetime <- strptime(paste(relevantData$Date, relevantData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerData <- as.numeric(relevantData$Global_active_power)
subMetering1 <- as.numeric(relevantData$Sub_metering_1)
subMetering2 <- as.numeric(relevantData$Sub_metering_2)
subMetering3 <- as.numeric(relevantData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()