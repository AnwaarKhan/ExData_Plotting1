# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('getCleanData.R')


plot4 <- function() {
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ##PLOT 2
  plot(data$timestamp,data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(data$timestamp,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data$timestamp,data$Sub_metering_2,col="red")
  lines(data$timestamp,data$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), cex=.5, bty="n")
  
  #PLOT 4
  plot(data$timestamp,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="./plots/plot4.png", width=480, height=480)
  dev.off()
}
plot4()