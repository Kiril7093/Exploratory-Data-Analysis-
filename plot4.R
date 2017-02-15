#Creating a working directory:
if(!file.exists("./data")){dir.create("./data")}

# Unzip "exdata_data_household_power_consumption" to /data directory:
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")

# Reading the table:
householdData <- "./data/household_power_consumption.txt"
data <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
relevantData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot data:
datetime <- strptime(paste(relevantData$Date, relevantData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
powerData <- as.numeric(relevantData$Global_active_power)
globalReactivePower <- as.numeric(relevantData$Global_reactive_power)
voltage <- as.numeric(relevantData$Voltage)
subMetering1 <- as.numeric(relevantData$Sub_metering_1)
subMetering2 <- as.numeric(relevantData$Sub_metering_2)
subMetering3 <- as.numeric(relevantData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, powerData, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

    

