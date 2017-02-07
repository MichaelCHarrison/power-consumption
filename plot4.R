plot4 <- function(){
        library(data.table, lubridate)
        setwd("~/Desktop/Coursera/Exploratory Analysis/power-consumption")
        headers <- fread("household_power_consumption.txt", nrow = 1)
        power_df <- fread("household_power_consumption.txt",
                          na.strings = "?",
                          skip = 66637,
                          nrow = 2880,
                          data.table = TRUE)
        
        colnames(power_df) <- colnames(headers)
        power_df$Date <- dmy(power_df$Date)
        plot_datetime <- as.POSIXct(paste(power_df$Date, power_df$Time))

        png("plot4.png",
            width = 480,
            height = 480,
            units = "px")
        
        par(mfrow = c(2,2))
        with(power_df,{
                plot(plot_datetime, power_df$Global_active_power,
                     xlab = "", ylab = "Global Active Power",
                     ylim = c(min(power_df$Global_active_power),
                              max(power_df$Global_active_power)),
                     type = "l")
                
                plot(plot_datetime, power_df$Voltage,
                     xlab = "datetime", ylab = "Voltage",
                     ylim = c(min(power_df$Voltage),
                              max(power_df$Voltage)),
                     col = "black", type = "l")
                
                plot(plot_datetime, power_df$Sub_metering_1, 
                     ylab = "Energy sub metering", xlab = "",
                     col = "black", type = "l")
                
                        lines(plot_datetime, power_df$Sub_metering_2,
                              col = "red", type = "l")
                        lines(plot_datetime, power_df$Sub_metering_3,
                              col = "blue", type = "l")
                        legend("topright", legend = names(power_df)[7:9],
                               col = c("black", "red", "blue"), lty = c(1,1),
                               bty = "n")
                
                plot(plot_datetime, power_df$Global_reactive_power,
                     xlab = "datetime", ylab = "Global_reactive_power",
                     col = "black", type = "l")
        })
                        
        dev.off()
        
}