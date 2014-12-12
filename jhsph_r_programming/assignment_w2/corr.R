corr <- function(directory, threshold = 0){

    vector_result <- numeric()

    for(i in 1:332){

        csvfile <- sprintf("%03d.csv", i)
        filepath <- file.path(directory, csvfile)
        data_i <- read.csv(filepath)

        data_i <- data_i[complete.cases(data_i),]
        n_complete <- nrow(data_i)

        if(n_complete > threshold){
            corl <- cor(data_i$sulfate,data_i$nitrate,
                        method="pearson")
            corl <- round(corl, 5)
            vector_result <- c(vector_result,corl)
        }
    }
    return(vector_result)
}
