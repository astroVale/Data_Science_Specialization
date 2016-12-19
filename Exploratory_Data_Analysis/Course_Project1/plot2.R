## Read the complete dataset
df <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Subset the data
data <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

## Convert the Date and Time variables to Date/Time classes
data$Date.Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## Plot 2
png(file="plot2.png", height=480, width=480)
plot(data$Date.Time,data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
