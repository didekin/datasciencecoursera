The script run_analysis.R executes the following tasks:

1. Download the project file.
2. Unzip it.
3. Create a data table wiht the activity labels.
4. Create a data table with the labels of the variables (features).
5. Create a data table with the training data, appending two columns 
   with the subjects ids and the activities codes.
6. Create a data table with the test data, similar to the previous one.
7. Merge training and test data tables.
8. Add names to the columns.
9. Extract a data table with mean and standard deviation measures.
10. Add descriptive labels for the activities.
11. Create a second, independent tidy data set with the average of each
    variable for each activity and each subject.
12. Finally, write a text file with the tidy data.

CODEBOOK

The variables included in the tidy data table are:

1. 'subject' identification: factor (integers) with levels in the range 1-30.
2. 'activity': factor with 6 levels, corresponding a the different activities 
   labels.
3. 'variable': factor with 66 levels, corresponding a the mean and standard 
   deviation measures.
   
     "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"           
     "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"        
     "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"        
     "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"       
     "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"          
     "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"          
     "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"      
     "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"          
     "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"      
     "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"     
     "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"           
     "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"       
     "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"       
     "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"          
     "fBodyGyro-std()-Z"               "fBodyAccMag-std()"          
     "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"     
     "fBodyBodyGyroJerkMag-std()"      "tBodyAcc-mean()-X"          
     "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"          
     "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"       
    "tGravityAcc-mean()-Z"             "tBodyAccJerk-mean()-X"      
     "tBodyAccJerk-mean()-Y"           "tBodyAccJerk-mean()-Z"      
     "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"         
     "tBodyGyro-mean()-Z"              "tBodyGyroJerk-mean()-X"     
     "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"     
     "tBodyAccMag-mean()"                 "tGravityAccMag-mean()"      
     "tBodyAccJerkMag-mean()"          "tBodyGyroMag-mean()"        
     "tBodyGyroJerkMag-mean()"         "fBodyAcc-mean()-X"          
     "fBodyAcc-mean()-Y"               "fBodyAcc-mean()-Z"          
     "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"      
     "fBodyAccJerk-mean()-Z"           "fBodyGyro-mean()-X"         
     "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"         
     "fBodyAccMag-mean()"              
     "fBodyBodyAccJerkMag-mean()" 
     "fBodyBodyGyroMag-mean()"         
     "fBodyBodyGyroJerkMag-mean()"

4. mean_value: numeric value wiht the mean of the observations of each 
   variable in the previous list, over the different combinations of
   subjet-activity.
