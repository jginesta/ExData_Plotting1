#R script called plot1.R that will recreate plot1.png that shows the Global Active Power.
HHPowerConsumption <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
HHPowerConsumption$Date <- as.Date((HHPowerConsumption$Date),format='%d/%m/%Y')

#Creating a smaller population that only contains the data for February 1st and 2nd.

HHPowerConsumption2007<-with(HHPowerConsumption, HHPowerConsumption[(Date >= "2007-02-01" & Date <= "2007-02-02") , ])

#Creates the histogram for Global Active Power
png('plot1.png',width = 480, height = 480)
hist(as.numeric(HHPowerConsumption2007$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  
dev.off()