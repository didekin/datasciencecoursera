pollutantmean <- function(directory, pollutant, id= 1:332){

    data_acc <- data.frame(pollutant = numeric())

    for(i in id){
        csvfile <- sprintf("%03d.csv", i)
        filepath <- file.path(directory, csvfile)
        datacsv_i <- read.csv(filepath)
        # To choose pollutant column in dataframe datacsv_i #
        data_pol <- subset(datacsv_i,select=pollutant)
        data_pol <- na.omit(data_pol)
        data_acc <- rbind(data_acc,data_pol)
    }
    mean_pol <- apply(data_acc,2,mean)
}








