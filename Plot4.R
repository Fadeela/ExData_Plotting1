dataframe<- read.table("C:/Users/Fadhila/Desktop/Coursera/Data Science/EDA/assignment 1/household_power_consumption.txt",
                       header=TRUE,sep = ";",stringsAsFactors = FALSE,dec=".") #read the .txt file 

subSetData <- dataframe[dataframe$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
Voltage <- as.numeric(subSetData$Voltage)
GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)

Plot4 <- png(filename = "Plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,2))
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, Voltage, type="l", ylab="Voltage",xlab="datetime")

plot(datetime, subSetData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy Sub Metering")
lines(datetime, subSetData$Sub_metering_2, type = "l", col="red")
lines(datetime, subSetData$Sub_metering_3, type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue")
       , bty = "n",cex = 0.75)

plot(datetime, GlobalReactivePower, type="l",  ylab="Global_reactive_power", xlab="datetime")

dev.off()