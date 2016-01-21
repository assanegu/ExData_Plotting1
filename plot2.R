require(sqldf)

# Read the data in the file for only the following two days: '1/2/2007','2/2/2007'
df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";", na.strings = "?")

# create a new date with time field 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
dateWithTime <- paste(as.Date(df$Date), df$Time)
dateWithTime <- as.POSIXct(dateWithTime)

# create and save the graph in the png file
png("plot2.png", width=480, height=480)

plot(df$Global_active_power ~ dateWithTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )

dev.off() 



