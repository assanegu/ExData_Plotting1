require(sqldf)

# Read the data in the file for only the following two days: '1/2/2007','2/2/2007'
df <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

# Create the png file and save the Global Active Power in it.
png("plot1.png", width=480, height=480)

hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col = "red", ylim = c(0, 1300))

dev.off() 













