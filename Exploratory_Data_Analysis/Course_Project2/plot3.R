library(ggplot2)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Grouping Baltimore PM2.5 emission for each years 1999, 2002, 2005, and 2008.
NEI.Baltimore <- NEI[which(NEI$fips == "24510"), ]

### Subsetting and summarize Baltimore PM2.5 emission by type and year
NEI.Baltimore.type <- ddply(NEI.Baltimore, .(type,year), summarize, Emissions = sum(Emissions))

### Plot 3
plot <- qplot(year, Emissions, data=NEI.Baltimore.type, color = type, geom = c("point", "line"), ylab = expression("Total PM"[2.5]*" Emissions"), 
      xlab = "Year") + facet_grid(type~., scales="free")
plot3 <- plot + labs(title= "Total Emissions in Baltimore City by Type of Pollutant") + theme(plot.title = element_text(face="bold", vjust=2))

png(file="plot3.png", height=480, width=480)
print(plot3)
dev.off()