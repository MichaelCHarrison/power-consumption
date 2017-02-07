plot3 <- function(){
        library(data.table, lubridate)
        setwd("~/Desktop/Coursera/Exploratory Analysis/power-consumption")
        headers <- fread("household_power_consumption.txt", nrow = 1)
        power_df <- fread("household_power_consumption.txt",
                          na.strings = "?",
                          skip = 66637,
                          nrow = 2880,
                          data.table = TRUE)
        
        colnames(power_df) <- colnames(headers)
        power_df[['Date']] <- as.Date(dmy(power_df[['Date']]))
        power_df[['Time']] <- as.POSIXct(strptime(power_df[['Time']], format = "%H:%M:%S"))
        
        png("plot3.png",
            width = 480,
            height = 480,
            units = "px")

        plot(power_df$Time, power_df$Sub_metering_1, col = "black", type = "l")
        plot(power_df$Time, power_df$Sub_metering_2, col = "red", type = "l")
        plot(power_df$Time, power_df$Sub_metering_3, col = "blue", type = "l",
             ylab = "Energy sub metering")
        
        legend("topright", legend = "Sub_metering_1", col = "black")
        legend("topright", legend = "Sub_metering_2", col = "red")
        legend("topright", legend = "Sub_metering_3", col = "blue")
        
}