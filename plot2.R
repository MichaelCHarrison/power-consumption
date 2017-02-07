plot2 <- function(){
        library(data.table, lubridate)
        setwd("~/Desktop/Coursera/Exploratory Analysis/power-consumption")
        df <- fread("household_power_consumption.txt",
                    header = TRUE,
                    na.strings = "?",
                    colClasses = c("Date" = "Date"),
                    data.table = TRUE)
        
        df$Date <- dmy(df$Date)
        df$Time <- strptime(df$Time, format = "%H:%M:%S")
        power_df <- df[Date %between% c("2007-02-01","2007-02-02")]
        
        plot <- plot(power_df$Time, power_df$Global_active_power)
                     # xlab = "",
                     # ylab = "Global Active Power (kilowatts)")
        
}