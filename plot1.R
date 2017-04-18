# read the data from the txt file
D <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                stringsAsFactors=FALSE, dec=".")

# subset for the two desired dates
D2 <- D[D$Date %in% c("1/2/2007","2/2/2007") ,]

# get the global active power data
P1 <- as.numeric(D2$Global_active_power)

# open png device
png("plot1.png", width=480, height=480)

# draw histogram
hist(P1, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# close the device
dev.off()