## plot1
total_years <- tapply(NEI$Emissions,NEI$year,sum)
barplot(total_years,main="Total emissions per year",
        xlab="Year",
        ylab="Emissions")