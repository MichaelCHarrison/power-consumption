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
        power_df$Date <- as.Date(dmy(power_df$Date))

        png("plot3.png",
            width = 480,
            height = 480,
            units = "px")

        plot_datetime <- as.POSIXct(paste(power_df$Date, power_df$Time))
        
        plot(plot_datetime, power_df$Sub_metering_1, col = "black", type = "l",
             ylab = "Energy sub metering", xlab = "")
        lines(plot_datetime, power_df$Sub_metering_2, col = "red", type = "l")
        lines(plot_datetime, power_df$Sub_metering_3, col = "blue", type = "l")

        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lty = c(1,1))
        
        dev.off()
}