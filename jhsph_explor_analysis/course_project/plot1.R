## plot1

# Assuming that the original files are in the same
#directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_years <- tapply(NEI$Emissions,NEI$year,sum)
barplot(total_years,main="Total emissions per year",
        xlab="Year",
        ylab="Emissions (in tons)")
dev.copy(png,file="plot1.png")
dev.off()