#Read the data
mydata <- read.table("./household_power_consumption.txt", sep = ";", header=TRUE)

#Convert Date column to character
mydata[,1]=as.character(mydata[,1])

#Convert the Time column to character
mydata[,2]=as.character(mydata[,2])

##Combine the Data and Time columns
mydata$DT = paste(mydata[,1], mydata[,2], sep=" ")

#Convert the combined column in to date/time
mydata$DT = strptime(mydata$DT, format = "%d/%m/%Y %H:%M:%S")

#Subset the data
mydata2 = subset(mydata, as.Date(mydata$DT) == as.Date("2007-2-01") | as.Date(mydata$DT) == as.Date("2007-2-02"))

#Convert the three columns.  Do I need to get rid of the NAs?
mydata2$Sub_metering_1 <- as.numeric(as.character(mydata2$Sub_metering_1))
mydata2$Sub_metering_2 <- as.numeric(as.character(mydata2$Sub_metering_2))
mydata2$Sub_metering_3 <- as.numeric(as.character(mydata2$Sub_metering_3))

#Create the PNG
png("plot3.png", bg = "transparent")

#Create the plot
plot(as.POSIXlt(mydata2$DT), as.numeric(as.character(mydata2$Sub_metering_1)), type = "l", bg = "transparent", ylab="Energy sub metering", xlab = "")
lines(as.POSIXlt(mydata2$DT), as.numeric(as.character(mydata2$Sub_metering_2)), type = "l", col="Red")
lines(as.POSIXlt(mydata2$DT), as.numeric(as.character(mydata2$Sub_metering_3)), type = "l", col="Blue")

#Addthe legend
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black","blue","red"))

#Close it!
dev.off()
