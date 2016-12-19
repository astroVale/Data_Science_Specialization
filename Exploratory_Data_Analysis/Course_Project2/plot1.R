NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Grouping total PM2.5 emission for each years 1999, 2002, 2005, and 2008.
NEI.grouped <- with(NEI, aggregate(Emissions, by = list(year), sum))

## Plot 1
png(file="plot1.png", height=480, width=480)
plot(NEI.grouped, type = "o", col = 'Blue', ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in the United States")
dev.off()