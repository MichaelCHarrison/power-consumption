plot2 <- function(){
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

        png("plot2.png",
            width = 480,
            height = 480,
            units = "px")
        
        plot(as.POSIXct(paste(power_df$Date, power_df$Time)), power_df$Global_active_power,
             xlab = "",
             ylab = "Global Active Power (kilowatts)",
             ylim = c(min(power_df$Global_active_power),max(power_df$Global_active_power)),
             type = "l")
        
        dev.off()
}