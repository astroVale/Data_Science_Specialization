NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Find coal combustion-related sources
SCC.coal <- grepl("Coal", SCC$Short.Name, ignore.case = TRUE)
combustion.coal.sources <- SCC[SCC.coal, ]

### Find emissions from coal combustion-related sources
coal.emissions <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

### Group by year
coal.grouped <- with(coal.emissions, aggregate(Emissions, by = list(year), sum))

### Plot 4
png("plot4.png", height=480, width=480)
plot(coal.grouped, type = "o", col = 'Red', ylab = expression("Total PM"[2.5]*" Emissions"), 
     xlab = "Year", main = "Emissions from Coal Combustion-related sources in U.S.")
dev.off()