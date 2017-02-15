
#Creating a working directory:
if(!file.exists("./data")){dir.create("./data")}

#Unzip "exdata_data_household_power_consumption" into working directory:
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")

#Reading the table:
householdData <- "./data/household_power_consumption.txt"
data <- read.table(householdData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
relevantData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot data:
powerData <- as.numeric(relevantData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(powerData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
