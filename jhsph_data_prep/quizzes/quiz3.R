# File with gdp data.

fileUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl,dest="./data/gdp1.csv",method="curl")

gdp2 <- read.csv(file="./data/gdp1.csv"
                 ,skip=5
                 ,as.is=c(1,2,4,5)
                 ,header=F
                 ,na.strings=c('""')
                 ,nrows=215
                 ,strip.white=T
                 ,skipNul=T
                 ,blank.lines.skip=T)

gdp2 <- gdp2[,c(1,2,4,5)]

names(gdp2) <- c("CountryCode","ranking","country","gdp")

gdp2 <- gdp2[gdp2$CountryCode != "",]

gdp2$gdp <- as.numeric(gsub(",","",gdp2$gdp))

# File with education data.

fileUrl <-
  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(fileUrl,dest="./data/edu1.csv",method="curl")

edu2 <- read.csv(file="./data/edu1.csv"
                 ,header=T
                 ,as.is=c(1,2,3)
                 ,na.strings=c('""')
                 ,strip.white=T
                 ,skipNul=T
                 ,blank.lines.skip=T)

edu2 <- edu2[edu2$CountryCode != "",c(1,3)]

# Merge of the two files.

library(plyr)
gdp_edu <- arrange(join(gdp2,edu2),CountryCode)

gedu_sort <- arrange(gdp_edu,desc(ranking))

# Average GDP ranking for "High income: OECD" and "High income: nonOECD"
# groups.

gedu_sort$Income.Group <- factor(gedu_sort$Income.Group)

gedu_avg1 <- ddply(gedu_sort,.(Income.Group),summarise,
                   mean_ranking=mean(ranking,na.rm=T))

# Cut the GDP ranking into 5 separate quantile groups. Make a table versus
# Income.Group. How many countries are Lower middle income but among the 38
# nations with highest GDP?

library(Hmisc)
gedu_sort$rankgroup <- cut2(gedu_sort$ranking,g=5)
table(gedu_sort$rankgroup,useNA=c("no"))
table(gedu_sort$rankgroup,gedu_sort$Income.Group)