## Objetive

This repository contain the Course Project for the Getting and Cleaning Data Course at the Coursera Specialization in Data Science.  
The goal of the project consists in create a R language script to import, clean and summarize a dataset from diferents files and export the obtained dataset to a file.  
The raw data to process can be obtained in the next link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files must be downloaded and extracted in the working directorie where the R script will be launched.  

## The Raw Data
The structure we must have after the extraction must be:  

*  **UCI HAR Dataset**            Root data directorie
    + **test**
        - **Inertial Signals**
        - *subject_test.txt*
        - *X\_test.txt*
        - *Y\_test.txt* 
    + **train**
        - **Inertial Signals**
        - *subject_train.txt*
        - *X\_train.txt*
        - *Y\_train.txt* 
    + *activity_labels.txt*
    + *features.txt*
    + *features_info.txt*
    + *README.txt*

## Desired Datasets
The R script is expected to create two dataset combining the data stored in the differents raw files.  

### Merged dataset
This is one table that Merges the training and the test sets in only one table adding one column for the subject who practice the sport, and other one for the sport practiced.  
Only the measurements on the mean and standard deviation for each measurement must be extracted to create the new table.  
The structure of this table is described above:  

|  **subject**  |  **sport**  |  **sensors data**  |  
|  -----------  |  --------  |  --------------------- |  
|  subject\_train.txt  |  Y\_train.txt  |  X\_train.txt  |  
|  subject\_test.txt  |  Y\_test.txt  |  X\_test.txt|  


### Summarized dataset
This table consist in the summarization of the previous one where the mean of each sensor data is represented for each subject and sport.  
The structure of this table is described above:  

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

1. In order to subset the datasets with the differents sensors values, an array with the deseables columns numbers is created based in the variable descriptiona given in the *'features.txt'* file.  
  
    > columns <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543) 
  
1. After this the differents files are loaded in memory. To do this _read.table_ function is use with each relevant file described before:  

    > trainData <- read.table("./UCI HAR Dataset//train/X\_train.txt")  
      trainSubject <- read.table("./UCI HAR Dataset//train/subject\_train.txt")  
      trainSport <- read.table("./UCI HAR Dataset//train/y\_train.txt")  
      testData <- read.table("./UCI HAR Dataset//test/X\_test.txt")  
      testSubject <- read.table("./UCI HAR Dataset//test/subject\_test.txt")  
      testSport <- read.table("./UCI HAR Dataset//test/y\_test.txt")  

1. The data files are subset using the _columns_ variable previously decraled:  

    > trainData <- trainData[,columns]  
      testData <- testData[,columns]  

1. And columns *subject* and *sport* are added to its correspondient variable using the _cbind_ function:  

    > trainData <- cbind(trainSubject, trainSport, trainData)  
      testData <- cbind(testSubject, testSport, testData)  

1. Then, both tables are merged using the _rbind_ function:

    > tidyData <- rbind(trainData, testData)  

1. Now it's time to label the data set with descriptive variable names. To do this, variable names are loaded from the _features.txt_ file, and _subject_ and _sport_ names are manually added for the first and second column.

    > col\_names <- read.table("./UCI HAR Dataset//features.txt")  
      col\_names <- c("subject", "sport", as.character(col\_names[columns,2]))

1. In order to obtains better variable names, expecial characters are removed from the *col\_names* variable using the *gsub* function. After that, a variable containig all the expecial characters that are going to be removed, is created: (escape character is necessary because the especial characters) 

    > charToRemove <- c( "-", "\\(", "\\)" )		## Characters to remove  
      for (k in charToRemove) col\_names <- gsub(k,"",col\_names)  

1. To obtain a more homogeneous variables names, some strings are changed in the *col\_names* variable using the *str_replace* function. This way, all the variables names in *col\_names* follows the pattern ***myVariableNameMeanX*** with capital letter marking the beginin of a new word except for the first one.

    > col_names <- str_replace(col_names,"mean", "Mean")  
      col_names <- str_replace( col_names, "std", "Std")  

1. And now, the names are assigned to the data set columns using the *colnames* function:

    > colnames(tidyData) <- col_names  

1. The last step to obtaind the requested data set is to use descriptive sports names to name the observations in the *sports* variable. To do this, sports names are loaded from *activity\_labels.txt* file and the value for each observation is changed transforming the *sports* variable into a *factor* variable and asiggning the readed descriptive values:

    > sport_names <- read.table("./UCI HAR Dataset/activity_labels.txt")  
      tidyData$sport <- factor(tidyData$sport, levels= 1:6, labels = sport_names[,2])

1. The data set is ready and it's exported to a comma separated text file in the current directory with the *write.table* function:

    > write.table(tidyData, "./tidyyData.txt", sep = ",", row.name=FALSE)  

In order to create the second data set requested, all the observations for each
