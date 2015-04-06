## read the data
library(data.table)

DT = fread("household_power_consumption.txt", na.strings = "?")

## subset the rows
DT = DT[Date == "1/2/2007" | Date == "2/2/2007"]

## Create the time axis
Tijd = strptime(paste(DT$Date, DT$Time), "%d/%m/%Y %H:%M:%S")

## Plot as line graph
plot(Tijd, as.numeric(DT$Global_active_power), ylab="Global Active Power (kilowatts)", type = "l")

## Copy the image to a file
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
