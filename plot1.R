plot1 <- function(directory){
#directory   "household_power_consumption.txt"
    
    data <- read.table(directory, sep = ";", header=TRUE, na.strings = "NA")
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    subdat <- subset(data, data$Date < as.Date("2007-02-03"))
    subdat <- subset(subdat, subdat$Date > as.Date("2007-01-31"))
    subdat[,3] <- as.numeric(as.character(subdat[,3]))


    png(file = "./plot1.png", width = 480, height = 480, units = "px")
        
    with(subdat, hist(Global_active_power, main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)"))
    
    dev.off()
}