# Q1.

if(!file.exists("./data")){
    dir.create(("./data"))
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileUrl,dest="./data/idaho_file.csv",method="curl")

idaho_data <- read.csv("./data/idaho_file.csv")

names1 <- names(idaho_data)
# Apply strsplit() to split all the names of the data frame on
# the characters "wgtp".

names2 <- strsplit(names1,"wgtp")

# Q2.
# Remove the commas from the GDP numbers in millions of dollars
# and average them.

fileUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl,dest="./data/gdp_b.csv",method="curl")

gdp_data <- read.csv(file="./data/gdp_b.csv"
                 ,skip=5
                 ,as.is=c(1,2,4,5)
                 ,header=F
                 ,na.strings=c('""')
                 ,nrows=215
                 ,strip.white=T
                 ,skipNul=T
                 ,blank.lines.skip=T)

gdp_data$V5 <- unlist(lapply(gdp_data$V5,gsub,pattern=","
                      ,replacement=""))

gdp_data$V5 <- unlist(lapply(gdp_data$V5,as.numeric))

mean_gdp <- mean(gdp_data$V5,na.rm=T)

mean_gdp

# Q3.
country_names <- gdp_data$V4
grep("United",country_names,value=T)

# Q4

fileUrl <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl,dest="./data/gdp_file.csv",method="curl")

gdp2 <- read.csv(file="./data/gdp_file.csv"
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

download.file(fileUrl,dest="./data/edu_file.csv",method="curl")

edu2 <- read.csv(file="./data/edu_file.csv"
                 ,header=T
                 ,as.is=c(1,2,3)
                 ,na.strings=c('""')
                 ,strip.white=T
                 ,skipNul=T
                 ,blank.lines.skip=T)

edu2 <- edu2[edu2$CountryCode != "",c("CountryCode","Special.Notes")]

# Merge of the two files.

library(plyr)
gdp_edu <- arrange(join(gdp2,edu2),CountryCode)

string <- "Fiscal year end: June 30"

june <- lapply(as.character(gdp_edu$Special.Notes)
                     ,grep,pattern=string,value=F)

sum(unlist(june))



# Q5.

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

times <- as.POSIXlt(sampleTimes)
length(times[times$year + 1900 == 2012])



