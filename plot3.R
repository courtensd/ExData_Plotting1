#read complete file in R
dataset <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset and remove NA for 2 requested days
dataset_subset <- na.omit(dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007", ])

#Create timestamp column by joining Date & Time and convert to POSIXCT format
dataset_subset$timestamp <- paste(dataset_subset$Date, dataset_subset$Time)
dataset_subset$dateTime <- as.POSIXct(strptime(dataset_subset$timestamp, "%d/%m/%Y %H:%M:%S"))

#create line plot and write to png file 'plot3' in the working directory
png(filename = "plot3.png", bg = "transparent")
        plot(dataset_subset$dateTime, dataset_subset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
        lines(dataset_subset$dateTime, dataset_subset$Sub_metering_2, col = "red")
        lines(dataset_subset$dateTime, dataset_subset$Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()