# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source('getCleanData.R')


plot1 <- function() {
  hist(data$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="./plots/plot1.png", width=480, height=480)
  dev.off()
}
plot1()
