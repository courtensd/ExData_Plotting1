#read complete file in R
dataset <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#subset and remove NA for 2 requested days
dataset_subset <- na.omit(dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007", ])

#Create timestamp column by joining Date & Time and convert to POSIXCT format
dataset_subset$timestamp <- paste(dataset_subset$Date, dataset_subset$Time)
dataset_subset$dateTime <- as.POSIXct(strptime(dataset_subset$timestamp, "%d/%m/%Y %H:%M:%S"))


#create line plot and write to png file 'plot4' in the working directory
png(filename = "plot4.png", bg = "transparent")
        #set frame of plot
        par(mfrow = c(2,2))
        #plot1
        plot(dataset_subset$dateTime, dataset_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        #plot2
        plot(dataset_subset$dateTime, dataset_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        #plot3
        plot(dataset_subset$dateTime, dataset_subset$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
        lines(dataset_subset$dateTime, dataset_subset$Sub_metering_2, col = "red")
        lines(dataset_subset$dateTime, dataset_subset$Sub_metering_3, col = "blue")
        legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        #plot4
        plot(dataset_subset$dateTime, dataset_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()