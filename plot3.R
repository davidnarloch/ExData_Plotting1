# read the data from the txt file
D <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                stringsAsFactors=FALSE, dec=".")

# subset for the two desired dates
D2 <- D[D$Date %in% c("1/2/2007","2/2/2007") ,]

# get exaxt data+time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S") 

# extract sub metering 1-3
sm1 <- as.numeric(D2$Sub_metering_1)
sm2 <- as.numeric(D2$Sub_metering_2)
sm3 <- as.numeric(D2$Sub_metering_3)

# by calling this function the English and not the German (system language)
# names for the days Thursday, Friday and Saturday are used
Sys.setlocale("LC_TIME", "C")

# open graphics device for png file
png("plot3.png", width=480, height=480)

# make normal plot fo first sub metering
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")

# use lines function to add lines for sub metering 2 and 3
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")

# add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

# close the graphics device
dev.off()