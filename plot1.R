plot1 <- function(){
        library(data.table)
        setwd("~/Desktop/Coursera/Exploratory Analysis/power-consumption")
        dt <- fread("household_power_consumption.txt",
                    header = TRUE,
                    na.strings = "?",
                    colClasses = c("Date" = "Date"),
                    data.table = TRUE)
        
        power_dt <- dt[Date >= ""]
}