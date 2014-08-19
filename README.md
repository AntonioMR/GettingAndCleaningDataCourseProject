# Getting and Cleaning Data Course Project

## Table of content
[TOC]

## Objective

This repository contain the Course Project for the Getting and Cleaning Data Course at the Coursera Specialization in Data Science.  
The goal of the project consists in create a R language script to import, clean and summarize a dataset from different files and export the obtained dataset to a file.  
The raw data to process can be obtained in the next link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files must be downloaded and extracted in the working directory where the R script will be launched.  

## The Raw Data


The structure we must have after the extraction must be:  
    
    
 *  **UCI HAR Dataset** ``Data  root directory``   
    + **test**  ``Contain the test data files``  
        - **Inertial Signals** ``Sensors raw data. Not used in this project``  
        - *subject\_test.txt*   ``Indentify the subject who practise the sport in each observation``    
        - *X\_test.txt*  ``Stores all the observation taken during the test periods``  
        - *y\_test.txt*  ``Identify the sport that is being practiced in each observation``  
    + **train**  ``Sensors raw data. Not used in this project``   
        - **Inertial Signals**  ``Sensors raw data. Not used in this project``     
        - *subject\_train.txt*  ``Indentify the subject who practise the sport in each orservation``     
        - *X\_train.txt*  ``Stores all the observation taken during the train periods``    
        - *y\_train.txt*   ``Identify the sport that is being practiced in each observation``  
    + *activity_labels.txt*  ``Stores the description for each value represented in the y\_*.txt files``   
    + *features.txt*  ``Stores the labels for all the variables in the X\_*.txt files``   
    + *features_info.txt*  ``A description about the features stored in the datasets``   
    + *README.txt*  ``A further description about all the experiment``   

More information about the raw data can be obtained in the README file described above.  

## Desired Datasets
The R script is expected to create two dataset combining the data stored in the different raw data files.  

### Merged dataset
This is one table that Merges the *training* and the *test* sets in only one table adding one column for the *subject* who practice the sport, and other one for the *sport* practiced.  
Only the measurements on the mean and standard deviation for each measurement must be extracted to create the new table.  
The structure of this table is described bellow:  

|  **subject**  |  **sport**  |  **sensors data**  |  
| :-----------: | :---------: | :----------------: |  
|  subject\_train.txt  |  Y\_train.txt  |  X\_train.txt  |  
|  subject\_test.txt  |  Y\_test.txt  |  X\_test.txt|  


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


## The table variables

The course project requests that only the measurements on the mean and standard deviation for each measurement must be extracted. And furthermore the labels must be transformed into more appropiate ones.  
All the variables labels in the generated tables are based in the originals ones. Specials characters like '-', '\(' or '\)' have been removed. In adition the "mean" and "std" strings have been changed with "Mean" and "Std" in order to obtain more readable ones instead of lowcase ones.  

| Original feature | Mean label          | Std label          |
| :--------------: | :-----------------: | :----------------: |
| tBodyAcc-XYZ     | tBodyAccMeanXYZ     | tBodyAccStdX       |
| tGravityAcc-XYZ  | tGravityAccMeanXYZ  | tGravityAccStdXYZ  |
| tBodyAccJerk-XYZ | tBodyAccJerkMeanXYZ | tBodyAccJerkStdXYZ |
| tBodyGyro-XYZ    | tBodyGyroMeanXYZ    | tBodyGyroStdX      |
| tBodyGyroJerk-XYZ| tBodyGyroJerkMeanXYZ| tBodyGyroJerkStdXYZ|
| tBodyAccMag      | tBodyAccMagMean     | tBodyAccMagStd     |
| tGravityAccMag   | tGravityAccMagMean  | tGravityAccMagStd  |
| tBodyAccJerkMag  | tBodyAccJerkMagMean | tBodyAccJerkMagStd |
| tBodyGyroMag     | tBodyGyroMagMean    | tBodyGyroMagStd    |
| tBodyGyroJerkMag | tBodyGyroJerkMagMean| tBodyGyroJerkMagStd|
| fBodyAcc-XYZ     | fBodyAccMeanXYZ     | fBodyAccStdXYZ     |
| fBodyAccJerk-XYZ | fBodyAccJerkMeanXYZ | fBodyAccJerkStdX   |
| fBodyGyro-XYZ    | fBodyGyroMeanX      | fBodyGyroStdX      |
| fBodyAccMag      | fBodyAccMagMean     | fBodyAccMagStd     |
| fBodyAccJerkMag  | fBodyBodyAccJerkMagMean| fBodyBodyAccJerkMagStd|
| fBodyGyroMag     | fBodyBodyGyroMagMean| fBodyBodyGyroMagStd|
| fBodyGyroJerkMag | fBodyBodyGyroJerkMagMean| fBodyBodyGyroJerkMagStd|

