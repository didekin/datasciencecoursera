fileUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl,dest="./data/gdp1.csv",method="curl")

gdp2 <- read.csv(file="./data/gdp1.csv"
                 ,header=F,skip=5,as.is=c(1,2,4,5)
                 ,na.strings=c('""')
                 ,nrows=215,strip.white=T
                 ,skipNul=T
                 ,blank.lines.skip=T)

gdp2 <- gdp2[,c(1,2,4,5)]

names(gdp2) <- c("CountryCode","ranking","country","gdp")

gdp2 <- gdp2[gdp2$CountryCode != "",]

gdp2$gdp <- as.numeric(gsub(",","",gdp2$gdp))

# File with education data.
