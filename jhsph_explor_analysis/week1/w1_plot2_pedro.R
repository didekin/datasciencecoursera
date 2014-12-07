w1_data <- read.table(
    "household_power_consumption.txt",header=TRUE,sep=";",
    na.strings=c("?")
    )

w1_data$NewDate <- strptime(
    paste(w1_data$Date,w1_data$Time),"%d/%m/%Y %H:%M:%S"
    )

mydata <- subset(
    w1_data,select=c(colnames(w1_data)[3:10]),
    subset=(NewDate >= "2007-02-01" & NewDate < "2007-02-03")
    )

mydata$WeekDay <- strftime(mydata$NewDate,"%a")

# Plot 2.
plot(mydata$NewDate,mydata$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)",
     type="l"
     )

dev.copy(png, file = "w1_plot2_pedro.png")
dev.off()
