require(sqldf)

# Read the data in the file for only the following two days: '1/2/2007','2/2/2007'
df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";", na.strings = "?")
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
dateWithTime <- paste(as.Date(df$Date), df$Time)
dateWithTime <- as.POSIXct(dateWithTime)

# create and save the graph in the png file
png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2), mar = c(4,5,1,1) )

with(df, {  
      plot( Global_active_power ~ dateWithTime, xlab = "", ylab = "Global Active Power", type = "l")
      plot(Sub_metering_1 ~ dateWithTime, xlab = "", ylab = "Energy submetering", type = "l")
      lines(Sub_metering_2 ~ dateWithTime, col = 'Red')
      lines(Sub_metering_3 ~ dateWithTime, col = 'Blue')
      legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2 )
      plot(Voltage ~ dateWithTime, xlab = "", ylab = "Voltage", type = "l")
      plot(Global_reactive_power ~ dateWithTime, xlab = "", ylab = "Global Reactive Power", type = "l")

      })


dev.off() 



