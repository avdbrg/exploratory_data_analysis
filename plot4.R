## read the data
library(data.table)

DT = fread("household_power_consumption.txt", na.strings = "?")

## subset the rows
DT = DT[Date == "1/2/2007" | Date == "2/2/2007"]

## Create the time axis
Tijd = strptime(paste(DT$Date, DT$Time), "%d/%m/%Y %H:%M:%S")

## set the parameters
par(mfrow = c(2,2))

## Plot as line graph
plot(Tijd, as.numeric(DT$Global_active_power), ylab="Global Active Power (kilowatts)", type = "l")
plot(Tijd, as.numeric(DT$Voltage), ylab="Voltage", xlab="datetime", type = "l")
with(DT, plot (Tijd, as.numeric(Sub_metering_1), ylab="Energy sub metering", type = "l"))
with(DT, points(Tijd, as.numeric(Sub_metering_2), type = "l", col="red"))
with(DT, points(Tijd, as.numeric(Sub_metering_3), type = "l", col="blue"))
legend("topright", lwd=2, col = c("black", "blue", "red"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), cex = 0.75)
plot(Tijd, as.numeric(DT$Global_reactive_power), ylab="Global Rective Power (kilowatts)", type = "l")

## Copy the image to a file

dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()

par(mfrow = c(1,1))
