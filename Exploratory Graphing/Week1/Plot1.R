rm(list=ls())

temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp)
file <- read.table(unz(temp, "household_power_consumption.txt"), header=T, sep=";")
unlink(temp)

file$Date <- as.Date(as.character(file$Date), format="%d/%m/%Y")
myfile <- subset(file,Date=="2007-02-01" | Date=="2007-02-02")

par(mfrow=c(1,1))
hist(as.numeric(myfile$Global_active_power)*2/1000,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()





