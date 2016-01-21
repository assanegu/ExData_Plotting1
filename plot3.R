require(sqldf)

# Read the data in the file for only the following two days: '1/2/2007','2/2/2007'
df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";", na.strings = "?")

# create a new date with time field 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
dateWithTime <- paste(as.Date(df$Date), df$Time)
dateWithTime <- as.POSIXct(dateWithTime)

# create and save the graph in the png file
png("plot3.png", width=480, height=480)
par(mfcol = c(1, 1), mar = c(4,4,1,1) )
with(df, {  plot(Sub_metering_1 ~ dateWithTime, xlab = "", ylab = "Energy submetering", type = "l")
      lines(Sub_metering_2 ~ dateWithTime, col = 'Red')
      lines(Sub_metering_3 ~ dateWithTime, col = 'Blue')
      legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2 )
})

dev.off() 



