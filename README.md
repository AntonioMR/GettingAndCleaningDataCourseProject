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
1. After this the differents files are loaded in memory. To do this "read.table" method is use with each ***** file describes before.  
1. the
