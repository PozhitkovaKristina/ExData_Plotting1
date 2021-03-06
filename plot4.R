

db <- read.csv2("household_power_consumption.txt", sep = ";", dec = "." , header = TRUE, na.strings = "?")
db <- db[grep("^[1,2]/2/2007",  db$Date), ]

db$DateTime <- strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S")
db$DateTime 

Sys.setlocale("LC_TIME", "US")


png ("plot4.png", width = 480, height = 480, restoreConsole = F, res = NA)
par(mfrow = c(2,2))

plot(db$DateTime, db$Global_active_power, type = "l",  ylab = "Global Active Power", xlab = "")
plot(db$DateTime, db$Voltage, type = "l",  ylab = "Voltage", xlab = "datetime")

plot(db$DateTime, db$Sub_metering_1,  type = "l", ylab = "Energy sub meterling", xlab = "")
  lines (db$DateTime, db$Sub_metering_2, col="red")
  lines (db$DateTime, db$Sub_metering_3, col="blue")   
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")  


plot(db$DateTime, db$Global_reactive_power, type = "l",  ylab = "Global_reactive_power", xlab = "datetime")

dev.off() 

