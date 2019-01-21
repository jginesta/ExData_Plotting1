#R script called plot3.R that will recreate plot3.png that shows the Energy Sub Metering vs Time
HHPowerConsumption <- read.delim("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
HHPowerConsumption$Date <- as.Date((HHPowerConsumption$Date),format='%d/%m/%Y')
#Creating a smaller population that only contains the data for February 1st and 2nd.

HHPowerConsumption2007<-with(HHPowerConsumption, HHPowerConsumption[(Date >= "2007-02-01" & Date <= "2007-02-02") , ])

#Translates it to year and time
HHPowerConsumption2007$Time <- strptime(paste(HHPowerConsumption2007$Date,HHPowerConsumption2007$Time),format="%Y-%m-%d %H:%M:%S")


#Creates the plot for Energy Sub Metering vs Time
png('plot3.png',width = 480, height = 480)
plot(HHPowerConsumption2007$Time,HHPowerConsumption2007$Sub_metering_1,type="l", ylab="Energy sub metering",xlab=" ")
lines(HHPowerConsumption2007$Time,HHPowerConsumption2007$Sub_metering_2, col="red")
lines(HHPowerConsumption2007$Time,HHPowerConsumption2007$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,2,3), col=c("black","red","blue"))
dev.off()