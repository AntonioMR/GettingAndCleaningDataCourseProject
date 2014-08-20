# Getting and Cleaning Data Course Project

## Table of Contents
- [Objective](#objective)
- [The Raw Data](#the-raw-data)
- [Desired Datasets](#desired-datasets)
    - [Merged dataset](#merged-dataset)
    - [Summarized dataset](#summarized-dataset)
- [The R Script](#the-r-script)
- [Imported Libraries](#imported-libraries)
- [The Script Variables](#the-script-variables)
- [Cleaning and Sorting process](#cleaning-and-sorting-process)

## Objective

This repository contain the Course Project for the [Getting and Cleaning Data Course](https://www.coursera.org/course/getdata) at the [Coursera Specialization in Data Science](https://www.coursera.org/specialization/jhudatascience/1?utm_medium=listingPage).  
The goal of the project consists in create a R language script to import, clean and summarize a dataset from different files and export the obtained dataset to a file.  
The raw data to process can be obtained in the next link:
[Raw dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The files must be downloaded and extracted in the working directory where the R script will be launched.  

## The Raw Data

The structure we must have after the extraction must be:  
    
 *  **UCI HAR Dataset**   
    + **test**  
        - **Inertial Signals**  
        - *subject\_test.txt*  
        - *X\_test.txt*  
        - *y\_test.txt*  
    + **train**  
        - **Inertial Signals**  
        - *subject\_train.txt*  
        - *X\_train.txt*  
        - *y\_train.txt*  
    + *activity_labels.txt*  
    + *features.txt*  
    + *features_info.txt*  
    + *README.txt*  

More information about the raw data can be obtained in the [CodeBook](https://github.com/AntonioMR/GettingAndCleaningDataCourseProject/blob/master/CodeBook.md#the-raw-data).  

## Desired Datasets
The R script is expected to create two dataset combining the data stored in the different raw data files.  

### Merged dataset
This is one table that Merges the *training* and the *test* sets in only one table adding one column for the *subject* who practice the sport, and other one for the *sport* practiced.  
Only the measurements on the mean and standard deviation for each measurement must be extracted to create the new table.  
The structure of this table is described bellow:  

|  **subject**  |  **sport**  |  **sensors data [1..66]**  |  
| :-----------: | :---------: | :----------------: |  
|  subject\_train.txt  |  Y\_train.txt  |  X\_train.txt  |  
|  subject\_test.txt  |  Y\_test.txt  |  X\_test.txt|  

More information about the variables in the table can be found in the [CodeBook](https://github.com/AntonioMR/GettingAndCleaningDataCourseProject/blob/master/CodeBook.md#the-datasets-variables)  
The resulting dataset is a table with 10299 observations of 68 variables.  

### Summarized dataset
This table consist in the summarization of the previous one where the mean of each variable data is represented for each *subject* and *sport*.  
The structure of this table is described bellow:  

|  **subject**  |  **sport**  |  **sensor measure 1**  |  **sensor measure 2**  |  **...**  |  **sensor measure n** |   
| :-----------: | :---------: | :--------------------: | :--------------------: | :-------: | :-------------------: |  
|  subject 1  |  sport 1  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject 2  |  sport 1  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  ...        |  sport 1  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject n  |  sport 1  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject 1  |  sport 2  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  ...        |  ...      |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject n  |  sport n  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  

The resulting dataset is a table with 180 observations of 68 variables.  

## The R Script  

Only one script have been written in order to obtain the two requested dataset. The script named *run\_analysis.R* must be executed in a working directory at the same level as the *UCI HAR Dataset* directory.  
The script return the summarized dataset as output and both datasets (merged and summarized ones) are available in the environment memory after the script has finished.
Also, two comma separated txt files are created with the two datasets in the working directory. Their names are *tidyyData.txt* and *summaryData.txt*  

## Imported Libraries

* [**data.table**](http://cran.r-project.org/web/packages/data.table/index.html): Loaded to use the 'data.table' data type.   
* [**reshape2**](http://cran.r-project.org/web/packages/reshape2/index.html): Loaded to use the 'aggregate' function.  
* [**stringr**](http://cran.r-project.org/web/packages/stringr/index.html): Loaded to use the 'str\_replace' function.  

## The Script Variables  

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

    > write.table(tidyData, "./tidyData.txt", sep = ",", row.name=FALSE)  

In order to create the second data set requested, all the observations for each variable are merged into the mean taken by the *subject* and *sport* variables.  

1. To do this, a new data set is created using the *aggregate* function from the previous tidy dataset. This function allows us to created new tables passing a function to each column and ordered by certain columns

    > summaryData <- aggregate(tidyData[,3:ncol(tidyData)], by = list(tidyData\$subject, tidyData\$sport), FUN = "mean")  

1. Now, the columns names must be assigned again in order to relabel the recently created ones.  

    > colnames(summaryData) <- colNames  

1. To finish, the obtained data set is exported to a comma separated text file in the current directory with the *write.table* function:  

    > write.table(summaryData, "./summaryData.txt", sep = ",", row.name=FALSE)  

In order to have a more ordered environment, temporal variables are deleted with the *rm* function. When the script finish, only the *tidyData* and the *summaryData* datasets are available in the local environment.  


