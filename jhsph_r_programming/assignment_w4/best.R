best <- function(state, outcome){

    out_data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv"
                         ,colClasses="character")

    # I order by hospital name.
    out_ord <- out_data[order(out_data[,"Hospital.Name"]),]
    # I select the rows with the state passed as argument.
    out_ord_state <- out_ord[out_ord[['State']]
                    == state,]

    # I assume that there must be, at least, one row per State. If not, the state is wrong.
    if(length(out_ord_state$State)==0){
        errorMsg <- paste("Error in (",state,",",outcome,"): Invalid state.",sep= " ")
        print(errorMsg)
        return()
    }

    # I build an expression for the column with the outcome passed as an argument.
    pattern0 <- "^Hospital.30.Day.Death.*"
    outc_1 <- strsplit(outcome," ")
    outc_1 <- unlist(outc_1)
    outc_1 <- paste(outc_1,sep="",collapse=".")
    outc_1 <- paste(pattern0,outc_1,sep="")
    death_rate <- grep(pattern=outc_1,names(out_data),ignore.case=T)

    # I look for the row with minimum death rate for the outcome.
    best <- which.min(out_ord_state[,death_rate])

    # I assume that there must be, at least, one row per State and outcome.
    # If not, the outcome is wrong.
    if(length(best)==0){
        print("Invalid outcome")
        return()
    }

    best_hospital <- out_ord_state[best,"Hospital.Name"]
}