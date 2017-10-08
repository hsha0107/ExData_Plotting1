## Data on the date 2007-02-01 starts at the row 66638th. There are 1440 observations 
## for each date. Total 2880 rows are read from the file.

dtset <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                     skip = 66637, nrows = 2880, stringsAsFactors = F)

## Set variable names using 1st line in the data file

names(dtset) <-read.table("household_power_consumption.txt", sep = ";", nrows = 1, 
                          stringsAsFactors = F)

## Making Plot

png("plot1.png")
hist(dtset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()