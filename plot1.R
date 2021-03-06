plot1 <- function(){
        library(data.table);library(lubridate)
        
        setwd("~/Desktop/Coursera/Exploratory Analysis/power-consumption")
        headers <- fread("household_power_consumption.txt", nrow = 1)
        power_df <- fread("household_power_consumption.txt",
                      na.strings = "?",
                      skip = 66637,
                      nrow = 2880,
                      data.table = TRUE)
        
        colnames(power_df) <- colnames(headers)
        power_df$Date <- dmy(power_df$Date)
        
        png("plot1.png",
            width = 480,
            height = 480,
            units = "px")
        
        hist <- hist(power_df$Global_active_power,
                     main = "Global Active Power",
                     xlab = "Global Active Power (kilowatts)",
                     col = "red",
                     ylim = c(0,1200))
        
        dev.off()
}