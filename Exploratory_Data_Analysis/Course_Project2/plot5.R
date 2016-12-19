NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Find motor vehicle sources
SCC.vehicle <- grepl("Vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle.sources <- SCC[SCC.vehicle, ]
vehicle.emissions <- NEI[(NEI$SCC %in% vehicle.sources$SCC), ]

### Find emissions from motor vehicle sources in Baltimore
NEI.vehicle.Baltimore <- vehicle.emissions[which(vehicle.emissions$fips == "24510"), ]

### Group by year
vehicle.Baltimore.grouped <- with(NEI.vehicle.Baltimore, aggregate(Emissions, by = list(year), sum))

### Plot 5
png("plot5.png", height=480, width=480)
plot(vehicle.Baltimore.grouped, type = "o", col = 'Red', ylab = expression("Total PM"[2.5]*" Emissions"), 
     xlab = "Year", main = "Emissions from Motor Vehicle sources in Baltimore City")
dev.off()