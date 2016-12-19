## Read the complete dataset
df <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Subset the data
data <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

## Convert the Date and Time variables to Date/Time classes
data$Date.Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot 4
png(file="plot4.png", height=480, width=480)
par(mfrow = c(2, 2))

with(data, {
        plot(Date.Time,Global_active_power, type="l",
             ylab="Global Active Power", xlab="")
        
        plot(Date.Time,Voltage, type="l",
             ylab="Voltage", xlab="datetime")
        
        plot(Date.Time,Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Date.Time,Sub_metering_2,col='Red')
        lines(Date.Time,Sub_metering_3,col='Blue')
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=1, lwd=2, bty="n")

        plot(Date.Time,Global_reactive_power, type="l",
        ylab="Global_reactive_power", xlab="datetime")
})
dev.off()
