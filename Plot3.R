dataframe<- read.table("C:/Users/Fadhila/Desktop/Coursera/Data Science/EDA/assignment 1/household_power_consumption.txt",
                       header=TRUE,sep = ";",stringsAsFactors = FALSE,dec=".") #read the .txt file 

subSetData <- dataframe[dataframe$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")


Plot3 <- png(filename = "Plot3.png", width = 480, height = 480)

Plot3<- plot(datetime, subSetData$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy Sub Metering")
lines(datetime, subSetData$Sub_metering_2, type = "l", col="red")
lines(datetime, subSetData$Sub_metering_3, type = "l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()