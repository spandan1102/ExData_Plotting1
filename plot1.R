
#reading the file
x<- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", na.strings = "?")

#Converting to date format
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

# Subsetting to required constraints
newx <- subset(x, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Printing and plotting file
png("plot1.png", width = 480, height = 480)
hist(newx$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
