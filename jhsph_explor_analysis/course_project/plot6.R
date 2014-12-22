## plot6

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

cities2_em <- subset(motor_em,
                       fips %in% c("06037","24510"),
                       select=c(Emissions,year,fips))

library(ggplot2)

ggplot(cities2_em,
       aes(x = factor(fips),y = Emissions)) +
    geom_bar(stat = "identity") +
    facet_grid(. ~ year) +
    labs(title = "Vehicle emissions (tons) in Los Angeles
         and Baltimore per year")

dev.copy(png,file="plot6.png")
dev.off()