## plot5

# Assuming that the original files are in the same
#directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# I assume that the following EI.Sector are related
# with motor vehicle sources.
# "Mobile - On-Road Diesel Heavy Duty Vehicles"
# "Mobile - On-Road Diesel Light Duty Vehicles"
# "Mobile - On-Road Gasoline Heavy Duty Vehicles"
# "Mobile - On-Road Gasoline Light Duty Vehicles"

# I obtain them:
motor_v <- levels(SCC$EI.Sector)[c(49:52)]

# SCC codes associated with motor vehicle EI.Sectors:
motor_set <- subset(SCC, EI.Sector %in% motor_v
                   ,select = SCC)

motor_em <- subset(NEI,
                   SCC %in% motor_set$SCC,
                   select=c(Emissions,year,fips))

baltimore_em <- subset(motor_em,
                         fips=="24510",
                         select=c(Emissions,year))

total_years <- tapply(baltimore_em$Emissions,
                      baltimore_em$year,
                      sum)

barplot(total_years,
        main="Baltimore: total mobile vehicle
        emissions per year",
        xlab="Year",
        ylab="Emissions (in tons)")

dev.copy(png,file="plot5.png")
dev.off()