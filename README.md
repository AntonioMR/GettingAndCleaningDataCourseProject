## Objective

This repository contain the Course Project for the Getting and Cleaning Data Course at the Coursera Specialization in Data Science.  
The goal of the project consists in create a R language script to import, clean and summarize a dataset from different files and export the obtained dataset to a file.  
The raw data to process can be obtained in the next link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files must be downloaded and extracted in the working directory where the R script will be launched.  

## The Raw Data
The structure we must have after the extraction must be:  

| route | description |  
| ------- | ---------------- |  
| *  **UCI HAR Dataset** | _Data  root directory_ |   
|    + **test** | _Contain the test data files_ |  
|        - **Inertial Signals** | _Sensors data. Not used in this project_ |  
|        - *subject\_test.txt* |  _Indentify the subject who practise the sport in each orservation_ |  
|        - *X\_test.txt* | _some text_ |  
|        - *Y\_test.txt* | _some text_ |  
|    + **train** | _some text_ |  
|        - **Inertial Signals** | _some text_ |  
|        - *subject\_train.txt* | _some text_ |  
|        - *X\_train.txt* | _some text_ |  
|        - *Y\_train.txt*  | _some text_ |  
|    + *activity_labels.txt* | _some text_ |  
|    + *features.txt* | _some text_ |  
|    + *features_info.txt* | _some text_ |  
|    + *README.txt* | _some text_ |  

More information about the raw data can be obtained in the README file described above.

## Desired Datasets
The R script is expected to create two dataset combining the data stored in the different raw data files.  

### Merged dataset
This is one table that Merges the *training* and the *test* sets in only one table adding one column for the *subject* who practice the sport, and other one for the *sport* practiced.  
Only the measurements on the mean and standard deviation for each measurement must be extracted to create the new table.  
The structure of this table is described bellow:  

|  **subject**  |  **sport**  |  **sensors data**  |  
|  -----------  |  --------  |  --------------------- |  
|  subject\_train.txt  |  Y\_train.txt  |  X\_train.txt  |  
|  subject\_test.txt  |  Y\_test.txt  |  X\_test.txt|  


### Summarized dataset
This table consist in the summarization of the previous one where the mean of each variable data is represented for each *subject* and *sport*.  
The structure of this table is described bellow:  

|  **subject**  |  **sport**  |  **sensor measure 1**  |  **sensor measure 2**  |  **...**  |  **sensor measure n** |   
|  ---------------  |  ------------  |  -------------------------------  |  --------------------------------  |  --------  |  ------------------------------  |  
|  subject 1  |  sport 1  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject 1  |  sport 2  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject 1  |  ...  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject 1  |  sport n  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject 2  |  sport 1  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  ...  |  ..  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  
|  subject n  |  sport n  |  mean measure 1  |  mean measure 2  |  ...  | mean measure n  |  



## Cleaning and sorting process

1. In order to subset the given data sets with the different sensors values, an array with the desirables columns numbers is created based in the variable description given in the *'features.txt'* file.  
  
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

    > col\_names <- read.table("./UCI HAR Dataset//features.txt")  
      col\_names <- c("subject", "sport", as.character(col\_names[columns,2]))

1. In order to obtain better variable names, special characters are removed from the *col\_names* variable using the *gsub* function. After that, a variable containing all the special characters that are going to be removed, is created: (escape character is necessary because the especial characters) 

    > charToRemove <- c( "-", "\\(", "\\)" )		## Characters to remove  
      for (k in charToRemove) col\_names <- gsub(k,"",col\_names)  

1. To obtain a more homogeneous variables names, some strings are changed in *col\_names* variable using the *str_replace* function. This way, all the variables names in *col\_names* follows the pattern ***myVariableNameMeanX*** with a capital letter marking the beginning of a new word except for the first one.

    > col_names <- str_replace(col_names,"mean", "Mean")  
      col_names <- str_replace( col_names, "std", "Std")  

1. And now, names are assigned to the data set columns using the *colnames* function:

    > colnames(tidyData) <- col\_names  

1. The last step to obtain the requested data set is to use descriptive sports names to name the observations in the *sports* variable. To do this, sports names are loaded from *activity\_labels.txt* file and the value for each observation is changed transforming the *sports* variable into a *factor* variable and assigning the read descriptive values:

    > sport\_names <- read.table("./UCI HAR Dataset/activity\_labels.txt")  
      tidyData$sport <- factor(tidyData$sport, levels= 1:6, labels = sport_names[,2])

1. The data set is ready and it's exported to a comma separated text file in the current directory with the *write.table* function:

    > write.table(tidyData, "./tidyyData.txt", sep = ",", row.name=FALSE)  

In order to create the second data set requested, all the observations for each variable are merged into the mean taken by the *subject* and *sport* variables.  

1. To do this, a new data set is created using the *aggregate* function from the previous tidy dataset. This function allows us to created new tables passing a function to each column and ordered by certain columns

    > summaryData <- aggregate(tidyData[,3:ncol(tidyData)], by = list(tidyData$subject, tidyData$sport), FUN = "mean")  

1. Now, the columns names must be assigned again in order to relabel the recently created ones.  

    > colnames(summaryData) <- col\_names  

1. To finish, the obtained data set is exported to a comma separated text file in the current directory with the *write.table* function:  

    > write.table(summaryData, "./summaryData.txt", sep = ",", row.name=FALSE)  

In order to have a more ordered environment, temporal variables are deleted with the *rm* function. When the script finish, only the *tidyData* and the *summaryData* datasets are available in the local environment.  
