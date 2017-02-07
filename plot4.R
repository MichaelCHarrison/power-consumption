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
        
        # png("plot2.png",
        #     width = 480,
        #     height = 480,
        #     units = "px")
        
        par(mfrow = c(2,2))
        plots <- with(power_df,{
                plot()
                #plot()
                #plot()
                #plot()
        })
        
        
}