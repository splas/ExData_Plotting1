rawdata <- "./household_power_consumption.txt"
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
Mydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),] #subset data

#Create a new column combining time and date
DateTime <- strptime(paste(Mydata$Date, Mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(Mydata$Sub_metering_1)
SM2 <- as.numeric(Mydata$Sub_metering_2)
SM3 <- as.numeric(Mydata$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(DateTime, SM1, type = "l", xlab = "", ylab="Energy sub metering")
lines(DateTime, SM2, type = "l", col = "red")
lines(DateTime, SM3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()