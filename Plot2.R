dataframe<- read.table("C:/Users/Fadhila/Desktop/Coursera/Data Science/EDA/assignment 1/household_power_consumption.txt",
                       header=TRUE,sep = ";",stringsAsFactors = FALSE,dec=".") #read the .txt file 

subSetData <- dataframe[dataframe$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

Plot2 <- png(filename = "Plot2.png", width = 480, height = 480)

Plot2 <- plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()