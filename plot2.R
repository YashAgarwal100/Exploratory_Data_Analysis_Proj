whole_Data <- read.table("rawdatafile.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
whole_Data$Date <- as.Date(whole_Data$Date, format="%d/%m/%Y")


data <- subset(whole_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(whole_Data)



time_date <- paste(as.Date(data$Date), data$Time)

data$Datetime <- as.POSIXct(time_date)


plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (in kilowatts)", xlab="Day")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

