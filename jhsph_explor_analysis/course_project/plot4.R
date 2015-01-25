## plot4

# Assuming that the original files are in the same
#directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## I assume that the following EI.Sector are related
## with coal combustion sources.
# "Fuel Comb - Comm/Institutional - Coal"
# "Fuel Comb - Electric Generation - Coal"
# "Fuel Comb - Industrial Boilers, ICEs - Coal"

coal_v <- levels(SCC$EI.Sector)[c(13,18,23)]

## SCC codes associated with coal EI.Sectors
coal_set <- subset(SCC, EI.Sector %in% coal_v
                   ,select = SCC)

## Subset of records in NEI with codes associated
## to coal combustion.
coal_em <- subset(NEI, SCC %in% coal_set$SCC
                  ,c(Emissions,year))

total_years <- tapply(coal_em$Emissions,coal_em$year
                      ,sum)

barplot(total_years,main="Coal combustion emissions
        per year",
        xlab="Year",
        ylab="Emissions (in tons)")
dev.copy(png,file="plot4.png")
dev.off()