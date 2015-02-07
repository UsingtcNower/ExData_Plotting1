plot1 <- function() {
  df <- read.delim("household_power_consumption.txt",sep=";", as.is=TRUE)

  df <- subset(df, Date %in% c("1/2/2007", "2/2/2007"), drop=TRUE)
  
  df$Global_active_power <- as.numeric(df$Global_active_power)
  
  
  png("plot1.png")
  with(df, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red"))
  dev.off()
}