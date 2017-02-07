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
        power_df[['Date']] <- as.Date(dmy(power_df[['Date']]))
        power_df[['Time']] <- as.POSIXct(strptime(power_df[['Time']], format = "%H:%M:%S"))
        
        png("plot2.png",
            width = 480,
            height = 480,
            units = "px")
        
        plot(power_df$Time, power_df$Global_active_power,
             xlab = "",
             ylab = "Global Active Power (kilowatts)",
             type = "l")
        
        #dev.off()
        
        
        
}