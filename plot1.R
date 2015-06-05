
dataset <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#convert to date and time
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
format(strptime(dataset$Time, format = "%H:%M:%S"), "%H:%M:%S")

#subset and remove any NA values
dataset_subset <- na.omit(dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02", ])

# create histogram and write to png file 'plot1' in the working directory
png(filename = "plot1.png", bg = "transparent")
        hist(dataset_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
