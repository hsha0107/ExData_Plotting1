## Data on the date 2007-02-01 starts at the row 66638th. There are 1440 observations 
## for each date. Total 2880 rows are read from the file.

dtset <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                    skip = 66637, nrows = 2880, stringsAsFactors = F)

## Set variable names using 1st line in the data file

names(dtset) <-read.table("household_power_consumption.txt", sep = ";", nrows = 1, 
                          stringsAsFactors = F)

## Convert date & time to appropriate format

date_time <- strptime(paste(dtset$Date, dtset$Time), "%d/%m/%Y %H:%M:%S")

## Making Plot

png("plot4.png")
par(mfrow = c(2,2))
plot(date_time, dtset$Global_active_power, type = "l", 
     xlab = NA, ylab = "Global Active Power")
plot(date_time, dtset$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")
plot(date_time, dtset$Sub_metering_1, type = "n", xlab = NA, 
     ylab = "Energy sub metering")
points(date_time, dtset$Sub_metering_1, type = "l")
points(date_time, dtset$Sub_metering_2, type = "l", col = "red")
points(date_time, dtset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = names(dtset)[7:9], bty = "n")
plot(date_time, dtset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()