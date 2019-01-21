#R script called plot2.R that will recreate plot2.png that shows the Global Active Power vs the Day.
HHPowerConsumption <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
HHPowerConsumption$Date <- as.Date((HHPowerConsumption$Date),format='%d/%m/%Y')
#Creating a smaller population that only contains the data for February 1st and 2nd.

HHPowerConsumption2007<-with(HHPowerConsumption, HHPowerConsumption[(Date >= "2007-02-01" & Date <= "2007-02-02") , ])

#Translates it to year and time
HHPowerConsumption2007$Time <- strptime(paste(HHPowerConsumption2007$Date,HHPowerConsumption2007$Time),format="%Y-%m-%d %H:%M:%S")

#Creates the plot for Global Active Power vs Time
png('plot2.png',width = 480, height = 480)
plot(HHPowerConsumption2007$Time,HHPowerConsumption2007$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab=" ")
dev.off()