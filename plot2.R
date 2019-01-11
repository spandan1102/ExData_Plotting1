#reading the file
x<- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?")

#Converting to date format
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

# Subsetting to required constraints
newx <- subset(x, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#preparing column with date and time
datetime <- paste(as.Date(newx$Date), newx$Time)
newx$datetime <- as.POSIXct(datetime)


#plotting
with(newx, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


# printing file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

