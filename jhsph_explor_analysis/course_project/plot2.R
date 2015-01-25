## plot2

# Assuming that the original files are in the same
#directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_em <- subset(NEI
                       ,fips=="24510"
                       ,select=c(Emissions,year))

totals_baltimore <- tapply(baltimore_em$Emissions
                           ,factor(baltimore_em$year)
                           ,sum)

barplot(totals_baltimore,
        main="Baltimore: total emissions per year",
        xlab="Year",
        ylab="Emissions (in tons)")

dev.copy(png,file="plot2.png")
dev.off()