# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('getCleanData.R')


plot2 <- function() {
  plot(data$timestamp,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="./plots/plot2.png", width=480, height=480)
  dev.off()
}
plot2()