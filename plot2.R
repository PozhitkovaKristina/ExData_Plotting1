

db <- read.csv2("household_power_consumption.txt", sep = ";", dec = "." , header = TRUE, na.strings = "?")
db <- db[grep("^[1,2]/2/2007",  db$Date), ]

db$DateTime <- strptime(paste(db$Date, db$Time), "%d/%m/%Y %H:%M:%S")
db$DateTime 

Sys.setlocale("LC_TIME", "US")


png (file = "plot2.png", width = 480, height = 480)
  plot(db$DateTime, db$Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off() 

#Sys.setlocale("LC_TIME", "Russian")
