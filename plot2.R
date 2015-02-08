plot2 <- function() {
  df <- read.delim("household_power_consumption.txt",sep=";", as.is=TRUE)

  df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"), drop=TRUE)
  
  df$Global_active_power <- as.numeric(df$Global_active_power)
  
  Sys.setlocale("LC_TIME", "en_US")
  df$datetime <- as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
  
  png("plot2.png")
  with(df, plot(datetime, Global_active_power, type="l", xlab="", 
                ylab="Global Active Power (kilowatts)"))
  dev.off()
}