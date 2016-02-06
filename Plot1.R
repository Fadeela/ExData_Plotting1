dataframe<- read.table("C:/Users/Fadhila/Desktop/Coursera/Data Science/EDA/assignment 1/household_power_consumption.txt",
               header=TRUE,sep = ";",stringsAsFactors = FALSE,dec=".") #read the .txt file 

subSetData <- dataframe[dataframe$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(subSetData$Global_active_power)

Plot1 <- png(filename = "Plot1.png", width = 480, height = 480)

Plot1 <- hist(GlobalActivePower, col="red",main="Global Active Power", xlab = "Global Active Power (kilowatts)"
     ,ylim = c(0,1200) )

dev.off()