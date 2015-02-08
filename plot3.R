plot3 <- function(directory){
    #directory   "household_power_consumption.txt"
    
    data <- read.table(directory, sep = ";", header=TRUE, na.strings = "NA")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    subdat <- subset(data, data$Date < as.Date("2007-02-03"))
    subdat <- subset(subdat, subdat$Date > as.Date("2007-01-31"))
    subdat[,3:9] <- sapply(subdat[,3:9], as.character)
    subdat[,3:9] <- sapply(subdat[,3:9], as.numeric)
    subdat$Date <- strptime(paste(subdat$Date, subdat$Time), "%Y-%m-%d %H:%M:%S")
    
    
    png(file = "./plot3.png", width = 480, height = 480, units = "px")
    with(subdat, plot(Date, Sub_metering_1, ylab = "Energy sub metering", xlab= "", type="l"))
    with(subdat, lines(Date, Sub_metering_2, type="l", col="red"))
    with(subdat, lines(Date, Sub_metering_3, type="l", col="blue"))
    legend("topright", col = c("black", "red", "blue"), lty= 1, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    
    dev.off()
}