
db <- read.csv2("household_power_consumption.txt", sep = ";", dec = "." , header = TRUE, na.strings = "?")
db <- db[grep("^[1,2]/2/2007",  db$Date), ]

png ("plot1.png", width = 480, height = 480)
  hist(db$Global_active_power, xlab="Global Active Power (killowatts)", col="red", main = "Global Active Power")
dev.off() 
