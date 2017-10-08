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

png("plot2.png")
plot(date_time, dtset$Global_active_power, type = "l", 
     xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()