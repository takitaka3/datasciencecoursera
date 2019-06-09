rm(list=ls())

temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp)
file <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";")
unlink(temp)

file$Date1 <- as.Date(as.character(file$Date), format="%d/%m/%Y")
myfile <- subset(file,Date1=="2007-02-01" | Date1=="2007-02-02")

myfile$DateTime <- as.POSIXct(paste(myfile$Date1, myfile$Time), format="%Y-%m-%d %H:%M:%S")

par(mfcol=c(2,2),mar=c(4,4,1,1))

plot(myfile$DateTime,as.numeric(myfile$Global_active_power)*2/1000,type="l", xlab="",ylab="Global Active Power")

plot(myfile$DateTime,as.numeric(myfile$Sub_metering_1),type="l", col="black",xlab="",ylab="Energy sub metering")
lines(myfile$DateTime,as.numeric(myfile$Sub_metering_2), col="red")
lines(myfile$DateTime,as.numeric(myfile$Sub_metering_3), col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=c(1,1,1) ,col=c("black", "red", "blue") )

plot(myfile$DateTime,as.numeric(as.character(myfile$Voltage)),type="l", xlab="datetime",ylab="Voltage")

plot(myfile$DateTime,as.numeric(as.character(myfile$Global_reactive_power)),type="l", xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()





