library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Find motor vehicle sources
SCC.vehicle <- grepl("Vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle.sources <- SCC[SCC.vehicle, ]
vehicle.emissions <- NEI[(NEI$SCC %in% vehicle.sources$SCC), ]

### Find emissions from motor vehicle sources in Baltimore
NEI.vehicle.Baltimore <- vehicle.emissions[which(vehicle.emissions$fips == "24510"), ]

### Group Baltimore vehicle emissions by year
vehicle.Baltimore.grouped <- with(NEI.vehicle.Baltimore, aggregate(Emissions, by = list(year), sum))
colnames(vehicle.Baltimore.grouped) <- c("Year", "Emissions")
vehicle.Baltimore.grouped$County <- "Baltimore City"

### Find emissions from motor vehicle sources in Los Angeles
NEI.vehicle.LA <- vehicle.emissions[which(vehicle.emissions$fips == "06037"), ]

### Group LA vehicle emissions by year
vehicle.LA.grouped <- with(NEI.vehicle.LA, aggregate(Emissions, by = list(year), sum))
colnames(vehicle.LA.grouped) <- c("Year", "Emissions")
vehicle.LA.grouped$County <- "Los Angeles County"

emissions.Baltimore.LA <- rbind(vehicle.Baltimore.grouped,vehicle.LA.grouped)

### Plot 6
plot <- ggplot(emissions.Baltimore.LA, aes(x=Year, y=Emissions)) +
        geom_point(aes(color=County),size=3) + 
        facet_grid(County  ~ ., scales="free") +
        ylab(expression(paste("Total ", PM[2.5], " Emissions"))) + 
        xlab("Year") +
        stat_smooth(method=lm, formula=y~x, se=FALSE, size=1, linetype=3) 

plot6 <- plot + labs(title= "Comparison of Motor Vehicle Emissions by County") + theme(plot.title = element_text(face="bold", vjust=2))

png(file="plot6.png", height=480, width=480)
print(plot6)
dev.off()