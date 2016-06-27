rawdata <- "./household_power_consumption.txt"
data <- read.table(rawdata, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
Mydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),] #subset data

#Create a new column combining time and date
DateTime <- strptime(paste(Mydata$Date, Mydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
Volt <- as.numeric(Mydata$Voltage)
png("plot3.png", width=480, height=480)
plot(DateTime, Volt, type = "l", xlab = "datetime", ylab="Voltage")
dev.off()