## read the data
library(data.table)

DT = fread("household_power_consumption.txt", na.strings = "?")

## subset the rows
DT = DT[Date == "1/2/2007" | Date == "2/2/2007"]

## Make histogran
hist(as.numeric(DT$Global_active_power), col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Copy output to a file and close the file
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

