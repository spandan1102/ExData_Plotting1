#reading the file
x<- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?")

#Converting to date format
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

# Subsetting to required constraints
newx <- subset(x, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#preparing column with date and time
datetime <- paste(as.Date(newx$Date), newx$Time)
newx$datetime <- as.POSIXct(datetime)


#Plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(newx, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.4)
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

# Printing
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
