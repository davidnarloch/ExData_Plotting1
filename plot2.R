# read the data from the txt file
D <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                stringsAsFactors=FALSE, dec=".")

# subset for the two desired dates
D2 <- D[D$Date %in% c("1/2/2007","2/2/2007") ,]

# get exaxt data+time
datetime <- strptime(paste(D2$Date, D2$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

# get the data that should be plotted
P1 <- as.numeric(D2$Global_active_power)

# by calling this function the English and not the German (system language)
# names for the days Thursday, Friday and Saturday are used
Sys.setlocale("LC_TIME", "C")

# open graphics device for png file
png("plot2.png", width=480, height=480)

# create the plot
plot(datetime, P1, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

# close the graphics device
dev.off()