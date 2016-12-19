NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Grouping Baltimore PM2.5 emission for each years 1999, 2002, 2005, and 2008.
NEI.Baltimore <- NEI[which(NEI$fips == "24510"), ]
Baltimore.grouped <- with(NEI.Baltimore, aggregate(Emissions, by = list(year), sum))
colnames(Baltimore.grouped) <- c("year", "Emissions")

## Plot 2
png(file="plot2.png", height=480, width=480)
plot(Baltimore.grouped, type = "o", col = 'Blue', ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in Baltimore City")
dev.off()