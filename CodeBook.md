# Getting and Cleaning Data Course Project

## Table of content
[TOC]

## The R Script  

## Imported Libraries

* **data.table**: Loaded to use the 'data.table' data type.   
* **reshape2**: Loaded to use the 'aggregate' function.  
* **stringr**: Loaded to use the '' function.  

## The script variables  

* **columns:** *This variable stores the features numbers that are going to be extracted from the raw datasets. It's removed before the script finishes*  
* **trainSubject:** *This variable stores the subject variable for each observation in the 'train' dataset and it's loaded from ``./UCI HAR Dataset/train/subject_test.txt`` file. It's removed before the script finishes*  
* **trainSport:** *This variable stores the sport definition variable for each observation in the 'train' dataset and it's loaded from ``./UCI HAR Dataset/train/y_test.txt`` file. It's removed before the script finishes*  
* **trainData:** *This variable stores all the observations for each variable in the 'train' dataset and it's loaded from ``./UCI HAR Dataset/train/X_test.txt`` file. After that, it's merged with trainSubject and trainSport variables to form an unique table. It's removed before the script finishes*  
* **testSubject:** *This variable stores the sport definition variable for each observation in the 'test' dataset and it's loaded from ``./UCI HAR Dataset/test/y_test.txt`` file. It's removed before the script finishes*  
* **testSport:** *This variable stores the sport definition variable for each observation in the 'test' dataset and it's loaded from ``./UCI HAR Dataset/test/y_test.txt`` file. It's removed before the script finishes*  
* **testData:** *This variable stores all the observations for each variable in the 'test' dataset and it's loaded from ``./UCI HAR Dataset/test/X_test.txt`` file. After that, it's merged with testSubject and testSport variables to form an unique table. It's removed before the script finishes*  
* **tidyData:** *This variable merges the trainData and testData variables in an unique dataset. It remains available in the R environment after the script has finished*  
* **colNames:** *This variable stores the description of the dataset variables loaded from ``./UCI HAR Dataset/features.txt`` file. It's removed before the script finishes*  
* **charToRemove:** *This variable stores a vector with the characters that are going to be removed from the original variable labels in order to do that more appropriate. It's removed before the script finishes*  
* **sportNames:** *This variable stores a vector with the sports descriptions loaded from ``./UCI HAR Dataset/activity_labels.txt`` file in order to change the sport numerical observations into more descriptive ones. It's removed before the script finishes*  
* **summaryData**: *This variable summarizes the tidyData with the mean of each variable taken by 'subject' and 'sport' variables. It remains available in the R environment after the script has finished*  

At the end of the script only the tidyData y summaryData variables remain available in the R environment. The rest of the variables are deleted before the script finishes.

## Cleaning and Sorting process

1. In order to subset the given data sets with the different sensors values, an array with the desirables columns numbers is created based in the variable description given in the *features.txt* file.  
  
    > columns <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)  
  
1. After this the different files are loaded in memory. To do this _read.table_ function is used with each relevant file described above:  

    > trainData <- read.table("./UCI HAR Dataset//train/X\_train.txt")  
      trainSubject <- read.table("./UCI HAR Dataset//train/subject\_train.txt")  
      trainSport <- read.table("./UCI HAR Dataset//train/y\_train.txt")  
      testData <- read.table("./UCI HAR Dataset//test/X\_test.txt")  
      testSubject <- read.table("./UCI HAR Dataset//test/subject\_test.txt")  
      testSport <- read.table("./UCI HAR Dataset//test/y\_test.txt")  

1. The data files are subset using the _columns_ variable previously declared:  

    > trainData <- trainData[,columns]  
      testData <- testData[,columns]  

1. And columns *subject* and *sport* are added to its correspondent variable data set using the _cbind_ function:  

    > trainData <- cbind(trainSubject, trainSport, trainData)  
      testData <- cbind(testSubject, testSport, testData)  

1. Then, rows in both tables are merged using the _rbind_ function, one over the other:

    > tidyData <- rbind(trainData, testData)  

1. Now it's time to label the data set with descriptive variable names. To do this, variable names are loaded from the _features.txt_ file, and _subject_ and _sport_ variables names are manually added for the first and second column.

    > colNames <- read.table("./UCI HAR Dataset//features.txt")  
      colNames <- c("subject", "sport", as.character(colNames[columns,2]))

1. In order to obtain better variable names, special characters are removed from the *colNames* variable using the *gsub* function. After that, a variable containing all the special characters that are going to be removed, is created: (escape character is necessary because the especial characters) 

    > charToRemove <- c( "-", "\\(", "\\)" )		## Characters to remove  
      for (k in charToRemove) colNames <- gsub(k,"",colNames)  

1. To obtain a more homogeneous variables names, some strings are changed in *colNames* variable using the *str_replace* function. This way, all the variables names in *colNames* follows the pattern ***myVariableNameMeanX*** with a capital letter marking the beginning of a new word except for the first one.

    > colNames <- str\_replace(col_names, "mean", "Mean")  
      colNames <- str\_replace( col_names, "std", "Std")  

1. And now, names are assigned to the data set columns using the *colnames* function:

    > colnames(tidyData) <- colNames  

1. The last step to obtain the requested data set is to use descriptive sports names to name the observations in the *sports* variable. To do this, sports names are loaded from *activity\_labels.txt* file and the value for each observation is changed transforming the *sports* variable into a *factor* variable and assigning the read descriptive values:

    > sportNames <- read.table("./UCI HAR Dataset/activity\_labels.txt")  
      tidyData\$sport <- factor(tidyData\$sport, levels= 1:6, labels = sportNames[,2])

1. The data set is ready and it's exported to a comma separated text file in the current directory with the *write.table* function:

    > write.table(tidyData, "./tidyyData.txt", sep = ",", row.name=FALSE)  

In order to create the second data set requested, all the observations for each variable are merged into the mean taken by the *subject* and *sport* variables.  

1. To do this, a new data set is created using the *aggregate* function from the previous tidy dataset. This function allows us to created new tables passing a function to each column and ordered by certain columns

    > summaryData <- aggregate(tidyData[,3:ncol(tidyData)], by = list(tidyData\$subject, tidyData\$sport), FUN = "mean")  

1. Now, the columns names must be assigned again in order to relabel the recently created ones.  

    > colnames(summaryData) <- colNames  

1. To finish, the obtained data set is exported to a comma separated text file in the current directory with the *write.table* function:  

    > write.table(summaryData, "./summaryData.txt", sep = ",", row.name=FALSE)  

In order to have a more ordered environment, temporal variables are deleted with the *rm* function. When the script finish, only the *tidyData* and the *summaryData* datasets are available in the local environment.  

## The datasets variables

* **subject:** Subject who practiced the activitie  
* **sport:**  Activitie that was practiced  
* **tBodyAccMeanX:** Body acceleration mean X axis  
* **tBodyAccMeanY:** Body acceleration mean Y axis  
* **tBodyAccMeanZ:** Body acceleration mean Z axis  
* **tBodyAccStdX:** Body acceleration standard deviation X axis  
* **tBodyAccStdY:** Body acceleration standard deviation Y axis  
* **tBodyAccStdZ:** Body acceleration standard deviation Z axis  
* **tGravityAccMeanX:** Gravity acceleration mean X axis  
* **tGravityAccMeanY:** Gravity acceleration mean Y axis  
* **tGravityAccMeanZ:** Gravity acceleration mean Z axis  
* **tGravityAccStdX:** Gravity acceleration standard deviation X axis  
* **tGravityAccStdY:** Gravity acceleration standard deviation Y axis  
* **tGravityAccStdZ:** Gravity acceleration standard deviation Z axis  
* **tBodyAccJerkMeanX:** Body acceleration Jerk signal mean X axis  
* **tBodyAccJerkMeanY:** Body acceleration Jerk signal mean Y axis  
* **tBodyAccJerkMeanZ:** Body acceleration Jerk signal mean Z axis  
* **tBodyAccJerkStdX:** Body acceleration Jerk signal standard deviation X axis  
* **tBodyAccJerkStdY:** Body acceleration Jerk signal standard deviation Y axis  
* **tBodyAccJerkStdZ:** Body acceleration Jerk signal standard deviation Z axis  
* **tBodyGyroMeanX:** Body gyroscope mean X axis  
* **tBodyGyroMeanY:** Body gyroscope mean Y axis  
* **tBodyGyroMeanZ:** Body gyroscope mean Z axis  
* **tBodyGyroStdX:** Body gyroscope standard deviation X axis  
* **tBodyGyroStdY:** Body gyroscope standard deviation Y axis  
* **tBodyGyroStdZ:** Body gyroscope standard deviation Z axis  
* **tBodyGyroJerkMeanX:** Body gyroscope Jerk signal mean X axis  
* **tBodyGyroJerkMeanY:** Body gyroscope Jerk signal mean Y axis  
* **tBodyGyroJerkMeanZ:** Body gyroscope Jerk signal mean Z axis  
* **tBodyGyroJerkStdX:** Body gyroscope Jerk signal standard deviation X axis  
* **tBodyGyroJerkStdY:** Body gyroscope Jerk signal standard deviation Y axis  
* **tBodyGyroJerkStdZ:** Body gyroscope Jerk signal standard deviation Z axis  
* **tBodyAccMagMean:** Body acceleration magnitude mean  
* **tBodyAccMagStd:** Body acceleration magnitude standard deviation  
* **tGravityAccMagMean:** Gravity acceleration magnitude mean  
* **tGravityAccMagStd:** Gravity acceleration magnitude standard deviation  
* **tBodyAccJerkMagMean:** Body acceleration Jerk signal magnitude Mean  
* **tBodyAccJerkMagStd:** Body acceleration Jerk signal magnitude standard deviation  
* **tBodyGyroMagMean:** Body gyroscope magnitude mean  
* **tBodyGyroMagStd:** Body gyroscope magnitude standard deviation  
* **tBodyGyroJerkMagMean:** Body gyroscope Jerk signal magnitude mean  
* **tBodyGyroJerkMagStd:** Body gyroscope Jerk signal magnitude standard deviation  
* **fBodyAccMeanX:** FFT body acceleration mean X axis  
* **fBodyAccMeanY:** FFT body acceleration mean Y axis  
* **fBodyAccMeanZ:** FFT body acceleration mean Z axis  
* **fBodyAccStdX:** FFT body acceleration standard deviation X axis  
* **fBodyAccStdY:** FFT body acceleration standard deviation Y axis  
* **fBodyAccStdZ:** FFT body acceleration standard deviation Z axis  
* **fBodyAccJerkMeanX:** FFT body acceleration Jerk signal mean X axis  
* **fBodyAccJerkMeanY:** FFT body acceleration Jerk signal mean Y axis  
* **fBodyAccJerkMeanZ:** FFT body acceleration Jerk signal mean Z axis  
* **fBodyAccJerkStdX:** FFT body acceleration Jerk signal standard deviation X axis  
* **fBodyAccJerkStdY:** FFT body acceleration Jerk signal standard deviation Y axis  
* **fBodyAccJerkStdZ:** FFT body acceleration Jerk signal standard deviation Z axis  
* **fBodyGyroMeanX:** FFT body gyroscope mean X axis  
* **fBodyGyroMeanY:** FFT body gyroscope mean Y axis  
* **fBodyGyroMeanZ:** FFT body gyroscope mean Z axis  
* **fBodyGyroStdX:** FFT body gyroscope standard deviation X axis  
* **fBodyGyroStdY:** FFT body gyroscope standard deviation Y axis  
* **fBodyGyroStdZ:** FFT body gyroscope standard deviation Z axis  
* **fBodyAccMagMean:** FFT body acceleration magnitude mean  
* **fBodyAccMagStd:** FFT body acceleration magnitude standard deviation  
* **fBodyBodyAccJerkMagMean:** FFT body acceleration Jerk signal magnitude mean  
* **fBodyBodyAccJerkMagStd:** FFT body acceleration Jerk signal magnitude standard deviation  
* **fBodyBodyGyroMagMean:** FFT body gyroscope magnitude mean  
* **fBodyBodyGyroMagStd:** FFT body gyroscope magnitude standard deviation  
* **fBodyBodyGyroJerkMagMean:** FFT body gyroscope Jerk signal magnitude mean  
* **fBodyBodyGyroJerkMagStd:** FFT body gyroscope Jerk signal magnitude standard deviation  
