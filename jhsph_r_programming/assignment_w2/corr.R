corr <- function(directory, threshold = 0){

    vector_result <- numeric()

    for(i in 1:332){
        csvfile <- sprintf("%03d.csv", i)
        filepath <- file.path(directory, csvfile)
        datacsv_i <- read.csv(filepath)
        n_complete <- sum(complete.cases(datacsv_i))

        if(n_complete > threshold){
            nit_col <- datacsv_i[,"nitrate"]
            sul_col <- datacsv_i[,"sulfate"]
            corl <- cor(nit_col,sul_col,use="complete.obs",
                        method="pearson")
            corl <- round(corl, 5)
            vector_result <- c(vector_result,corl)
        }
    }
    print(head(vector_result))
    print(round(summary(vector_result),4))
}
