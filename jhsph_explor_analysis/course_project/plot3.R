## plot3

# Assuming that the original files are in the same
#directory.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_em <- subset(NEI
                       ,fips=="24510"
                       ,select=c(Emissions,type,year))

library(ggplot2)

ggplot(baltimore_em,
       aes(x = factor(year),y = Emissions)) +
    geom_bar(stat = "identity") +
    facet_grid(. ~ type) +
    labs(title = "Emissions per type for Baltimore")

dev.copy(png,file="plot3.png")
dev.off()