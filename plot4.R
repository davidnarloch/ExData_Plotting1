# read the data from the txt file
D <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                stringsAsFactors=FALSE, dec=".")

# subset for the two desired dates
D2 <- D[D$Date %in% c("1/2/2007","2/2/2007") ,]

# get exaxt data+time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S") 

# extract the data needed for plotting
gap <- as.numeric(D2$Global_active_power)
grp <- as.numeric(D2$Global_reactive_power)
vol <- as.numeric(D2$Voltage)
sm1 <- as.numeric(D2$Sub_metering_1)
sm2 <- as.numeric(D2$Sub_metering_2)
sm3 <- as.numeric(D2$Sub_metering_3)

# by calling this function the English and not the German (system language)
# names for the days Thursday, Friday and Saturday are used
Sys.setlocale("LC_TIME", "C")

# open graphics device for png file
png("plot4.png", width=480, height=480)

# enables to plot 4 plots in one graphics device
par(mfrow = c(2, 2))

# first plot
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# second plot
plot(datetime, vol, type="l", xlab="datetime", ylab="Voltage")

# third plot
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# fourth plot
plot(datetime, gap, type="l", xlab="datetime",
     ylab="Global_reactive_power")

# close the graphics device
dev.off()