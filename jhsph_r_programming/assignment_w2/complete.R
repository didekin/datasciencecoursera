complete <- function(directory, id = 1:332) {
    data_final <- data.frame(id = numeric(), nobs = numeric())

    for(i in id){
        csvfile <- sprintf("%03d.csv", i)
        filepath <- file.path(directory, csvfile)
        datacsv_i <- read.csv(filepath)
        id_i <- i
        nobs_i <- sum(complete.cases(datacsv_i))
        newRow <- data.frame(id=id_i, nobs=nobs_i)
        data_final <- rbind(data_final,newRow)
    }
    print(data_final)
}