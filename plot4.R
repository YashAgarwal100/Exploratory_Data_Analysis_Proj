raw_data <- read.table("rawdatafile.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")

data <- subset(raw_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(raw_data)

dnt<- paste(as.Date(data$Date), data$Time)


data$Datetime <- as.POSIXct(dnt)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
  plot(Global_active_power~Datetime, type="l",  ylab="_Global Active Power_", xlab="Day")
  plot(Voltage~Datetime, type="l",  ylab="Voltage (in volts)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="Day")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_Reactive_Power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()

