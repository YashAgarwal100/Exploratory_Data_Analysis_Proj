Z <- read.table(file = "rawdatafile.txt", 
                
                   header = T,sep = ";",na.strings="?")

Z$Date <- as.Date(Z$Date, format = "%d/%m/%Y")

Z <- subset(Z, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
Z$datetime <- strptime(paste(Z$Date, Z$Time), "%Y-%m-%d %H:%M:%S")

hist(Z$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()

