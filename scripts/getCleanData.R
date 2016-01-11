## Download the file
if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/powerconsumption.zip")

## unzip the file
file <- unzip(zipfile="./data/powerconsumption.zip",exdir="./data")

## read file
powerConsumption <- read.table(file, header=T, sep=";")

## set date format
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## get subset of data
data <- powerConsumption[(powerConsumption$Date=="2007-02-01") | (powerConsumption$Date=="2007-02-02"),]

## set variables
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))