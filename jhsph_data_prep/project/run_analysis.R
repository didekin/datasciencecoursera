fileUrl <- paste("https://d396qusza40orc.cloudfront.net/",
                 "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                 sep="")

download.file(fileUrl,dest="./data/Dataset.zip",method="curl")

unzip("data/Dataset.zip",list=T, exdir="./data")

# Dataset with activity labels.
labels_full <- read.table(
                file="./data/UCI HAR Dataset/activity_labels.txt",
                header=F)

#Dataset with variables codes and labels.
features <- read.table(
            file="./data/UCI HAR Dataset/features.txt"
            ,header=F
            ,as.is=c(1,2)
            )

# Datasets for the training data.

xdata_tr <- read.table(
    file="./data/UCI HAR Dataset/train/X_train.txt"
    ,header=F
    )

xsubjects_tr <- read.table(
    file="./data/UCI HAR Dataset/train/subject_train.txt"
    ,header=F
    )

ylabels_tr <- read.table(
    file="./data/UCI HAR Dataset/train/y_train.txt"
    ,header=F
)

xdata_sub_lab_tr <- cbind(xdata_tr,xsubjects_tr,ylabels_tr)

# Datasets for the test data.

xdata_test <- read.table(
    file="./data/UCI HAR Dataset/test/X_test.txt"
    ,header=F
)

xsubjects_test <- read.table(
    file="./data/UCI HAR Dataset/test/subject_test.txt"
    ,header=F
)

ylabels_test <- read.table(
    file="./data/UCI HAR Dataset/test/y_test.txt"
    ,header=F
)

xdata_sub_lab_test <- cbind(xdata_test,xsubjects_test,ylabels_test)

# Merges the training and the test sets to create one data set, plus
# columns for activity and subject.

xdata_sub_lab_all <- rbind(xdata_sub_lab_tr,xdata_sub_lab_test)

# Appropriately labels the data set with descriptive variable names.

names(xdata_sub_lab_all) <- c(features[,2],"subject","activity")

index_sub <- length(names(xdata_sub_lab_all)) - 1
index_act <- length(names(xdata_sub_lab_all))


# Select names with mean() or std().

index_std <- grep("std()", names(xdata_sub_lab_all),fixed=T)

index_mean <- grep("mean()", names(xdata_sub_lab_all),fixed=T)

# Extracts only the measurements on the mean and standard deviation
# for each measurement, plus subject and activity.

xdata_mean_std <- xdata_sub_lab_all[,c(index_std,index_mean
                                       ,index_sub,index_act)]

# Uses descriptive activity names to name the activities in the
# data set.

library(dplyr)
xdata_labelled <- mutate(xdata_mean_std,
                        activity = levels(labels_full[,2])[activity])

# Creates a second, independent tidy data set with the average of each
# variable for each activity and each subject.

xdata_groups <- mutate(xdata_labelled,activity=factor(activity)
                       ,subject=factor(subject))

var_measure <- names(xdata_groups)[1:(dim(xdata_groups)[[2]]-2)]

xdata_melt <- melt(xdata_groups,id.vars=c("subject","activity")
                   ,measure.vars=var_measure)

library(plyr)
xdata_tidy <- ddply(xdata_melt,.(subject,activity,variable)
                    ,summarise
                    ,mean_value = mean(value)
                    )

# Text file with the tidy data

write.table(xdata_tidy,file="./data/xdata_tidy.txt",row.names=F)