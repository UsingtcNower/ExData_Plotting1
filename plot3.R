plot3 <- function() {
  df <- read.delim("household_power_consumption.txt",sep=";", as.is=TRUE)

  df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"), drop=TRUE)
  
  df$Global_active_power <- as.numeric(df$Global_active_power)
  
  Sys.setlocale("LC_TIME", "en_US")
  df$datetime <- as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
  
  png("plot3.png")
  with(df, plot(datetime, Sub_metering_1, col="black", type="l", xlab="", 
                ylab="Energy sub metering"))
  with(df, points(datetime, Sub_metering_2, col="red", type="l"))
  with(df, points(datetime, Sub_metering_3, col="blue", type="l"))
  legend("topright", lty=1, lwd=1, col=c("black","red","blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}