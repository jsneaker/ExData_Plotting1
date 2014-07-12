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

#subset based on the two dates in the project.  
mydata2 = subset(mydata, as.Date(mydata$DT) == as.Date("2007-2-01") | as.Date(mydata$DT) == as.Date("2007-2-02"))

#Convert that column
mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))

#Get rid of any NAs
mydata2 <- subset(mydata2, !is.na(mydata2$Global_active_power))

#Create the PNG
png("plot1.png")


#Create the histogram
hist(as.numeric(as.character(mydata2$Global_active_power)), breaks=20, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "Red")

#Close it!
dev.off()
