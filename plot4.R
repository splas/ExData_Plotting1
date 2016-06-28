rawdata <- "./household_power_consumption.txt"
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
Mydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] #subset data

#Create a new column combining time and date
DateTime <- strptime(paste(Mydata$Date, Mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(Mydata$Global_active_power)
Reactivepower <- as.numeric(Mydata$Global_reactive_power)
Volt <- as.numeric(Mydata$Voltage)
SM1 <- as.numeric(Mydata$Sub_metering_1)
SM2 <- as.numeric(Mydata$Sub_metering_2)
SM3 <- as.numeric(Mydata$Sub_metering_3)

png("plot4.png", width=480, height=480)

#sets graphing parameters
par(mfrow = c(2,2))

#sets graph 1
plot(DateTime, GAP, type = "l", xlab = "", ylab="Global Active Power", cex = 0.2)

#sets graph 2
plot(DateTime, Volt, type = "l", xlab = "datetime", ylab="Voltage")

#sets graph 3
plot(DateTime, SM1, type = "l", xlab = "", ylab="Energy sub metering")
lines(DateTime, SM2, type = "l", col = "red")
lines(DateTime, SM3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 2.5, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "o")

#sets graph 4
plot(DateTime, Reactivepower, type = "l", xlab = "datetime", ylab="Global_reative_power")

dev.off()