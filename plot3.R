rawdata <- "./household_power_consumption.txt"
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
Mydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),] #subset data

#Create a new column combining time and date
DateTime <- strptime(paste(Mydata$Date, Mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(Mydata$Sub_metering_1)
SM2 <- as.numeric(Mydata$Sub_metering_2)
SM3 <- as.numeric(Mydata$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(DateTime, C(SM1, SM2, SM3), col = c("black", "red", "blue"), type = "l", xlab = "", ylab="Energy sub metering")
legend("topright", pch = plotchar, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Submetering_3"))
dev.off()