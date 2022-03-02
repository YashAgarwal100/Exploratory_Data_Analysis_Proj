full_DATA <- read.table("rawdatafile.txt", header=T, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
full_DATA$Date <- as.Date(full_DATA$Date, "%d/%m/%Y")
full_DATA <- subset(full_DATA,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
full_DATA <- full_DATA[complete.cases(full_DATA),]


dateTime <- paste(full_DATA$Date, full_DATA$Time)
dateTime <- setNames(dateTime, "DateTime")

full_DATA <- full_DATA[ ,!(names(full_DATA) %in% c("Date","Time"))]
full_DATA <- cbind(dateTime, full_DATA)
full_DATA$dateTime <- as.POSIXct(dateTime)

with(full_DATA, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy Sub Metering", xlab="DAY")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

