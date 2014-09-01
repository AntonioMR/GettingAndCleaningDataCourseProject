# Getting and Cleaning Data Course Project

## Table of Contents
- [The Raw Data](#the-raw-data)
- [The Dataset Variables](#the-dataset-variables)
- [Variables Units](#variables-units)

## The Raw data

The raw data are several dataset collected from the accelerometers from the Samsung Galaxy S smartphone.  
A group of 30 volunteers have been recording accelerometers and gyroscope values while they were practicing six differents activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  
Two datasets were recorded, one during a test period and other one during a training period.  
After that, the recorded have been processed in order to obtain several statystics mesures of the raw accelerometers and gyroscope datasets.  
The data is packaged in a Zip file and can be downloaden from the next link:
[Raw dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
After the files are unzipped you must have the following files and directories structure.  

 *  **UCI HAR Dataset** ``Data  root directory``   
    + **test**  ``Contain the test data files``  
        - **Inertial Signals** ``Sensors raw data. Not used in this project``  
        - *subject\_test.txt*   ``Indentify the subject who practise the activity in each observation``    
        - *X\_test.txt*  ``Stores all the proccessed observation taken during the test periods``  
        - *y\_test.txt*  ``Identify the activity that is being practiced in each observation``  
    + **train**  ``Sensors raw data. Not used in this project``   
        - **Inertial Signals**  ``Sensors raw data. Not used in this project``     
        - *subject\_train.txt*  ``Indentify the subject who practise the activity in each orservation``     
        - *X\_train.txt*  ``Stores all the proccessed observation taken during the train periods``    
        - *y\_train.txt*   ``Identify the activity that is being practiced in each observation``  
    + *activity_labels.txt*  ``Stores the description for each value represented in the y\_*.txt files``   
    + *features.txt*  ``Stores the labels for all the variables in the X\_*.txt files``   
    + *features_info.txt*  ``A description about the features stored in the datasets``   
    + *README.txt*  ``A further description about all the experiment``   

More information about the raw data can be obtained in the *README.txt* file contained in the zip file.  

## The Dataset Variables

The course project requests that only the measurements on the mean and standard deviation for each measurement must be extracted. And furthermore the labels must be transformed into more appropiate ones.  
Only variables with mean and stardard deviation observation have been taken to create the requested tables. Created tables have sixty six variables in adition to the subject and activity variable.  
All the variables labels in the generated tables are based in the originals ones. Specials characters like '-', '\(' or '\)' have been removed. In adition the "mean" and "std" strings have been changed with "Mean" and "Std" in order to obtain more readable ones (low Camel) instead of all lowcase ones.  
The original variables can be founded in the *features.txt* file contained in the raw dataset.  
Both generated tables have the following variables:

1. **subject:** Subject who practiced the activitie  
1. **activity:**  activity that was being practiced  
1. **tBodyAccMeanX:** Body acceleration mean X axis  
1. **tBodyAccMeanY:** Body acceleration mean Y axis  
1. **tBodyAccMeanZ:** Body acceleration mean Z axis  
1. **tBodyAccStdX:** Body acceleration standard deviation X axis  
1. **tBodyAccStdY:** Body acceleration standard deviation Y axis  
1. **tBodyAccStdZ:** Body acceleration standard deviation Z axis  
1. **tGravityAccMeanX:** Gravity acceleration mean X axis  
1. **tGravityAccMeanY:** Gravity acceleration mean Y axis  
1. **tGravityAccMeanZ:** Gravity acceleration mean Z axis  
1. **tGravityAccStdX:** Gravity acceleration standard deviation X axis  
1. **tGravityAccStdY:** Gravity acceleration standard deviation Y axis  
1. **tGravityAccStdZ:** Gravity acceleration standard deviation Z axis  
1. **tBodyAccJerkMeanX:** Body acceleration Jerk signal mean X axis  
1. **tBodyAccJerkMeanY:** Body acceleration Jerk signal mean Y axis  
1. **tBodyAccJerkMeanZ:** Body acceleration Jerk signal mean Z axis  
1. **tBodyAccJerkStdX:** Body acceleration Jerk signal standard deviation X axis  
1. **tBodyAccJerkStdY:** Body acceleration Jerk signal standard deviation Y axis  
1. **tBodyAccJerkStdZ:** Body acceleration Jerk signal standard deviation Z axis  
1. **tBodyGyroMeanX:** Body gyroscope mean X axis  
1. **tBodyGyroMeanY:** Body gyroscope mean Y axis  
1. **tBodyGyroMeanZ:** Body gyroscope mean Z axis  
1. **tBodyGyroStdX:** Body gyroscope standard deviation X axis  
1. **tBodyGyroStdY:** Body gyroscope standard deviation Y axis  
1. **tBodyGyroStdZ:** Body gyroscope standard deviation Z axis  
1. **tBodyGyroJerkMeanX:** Body gyroscope Jerk signal mean X axis  
1. **tBodyGyroJerkMeanY:** Body gyroscope Jerk signal mean Y axis  
1. **tBodyGyroJerkMeanZ:** Body gyroscope Jerk signal mean Z axis  
1. **tBodyGyroJerkStdX:** Body gyroscope Jerk signal standard deviation X axis  
1. **tBodyGyroJerkStdY:** Body gyroscope Jerk signal standard deviation Y axis  
1. **tBodyGyroJerkStdZ:** Body gyroscope Jerk signal standard deviation Z axis  
1. **tBodyAccMagMean:** Body acceleration magnitude mean  
1. **tBodyAccMagStd:** Body acceleration magnitude standard deviation  
1. **tGravityAccMagMean:** Gravity acceleration magnitude mean  
1. **tGravityAccMagStd:** Gravity acceleration magnitude standard deviation  
1. **tBodyAccJerkMagMean:** Body acceleration Jerk signal magnitude Mean  
1. **tBodyAccJerkMagStd:** Body acceleration Jerk signal magnitude standard deviation  
1. **tBodyGyroMagMean:** Body gyroscope magnitude mean  
1. **tBodyGyroMagStd:** Body gyroscope magnitude standard deviation  
1. **tBodyGyroJerkMagMean:** Body gyroscope Jerk signal magnitude mean  
1. **tBodyGyroJerkMagStd:** Body gyroscope Jerk signal magnitude standard deviation  
1. **fBodyAccMeanX:** FFT body acceleration mean X axis  
1. **fBodyAccMeanY:** FFT body acceleration mean Y axis  
1. **fBodyAccMeanZ:** FFT body acceleration mean Z axis  
1. **fBodyAccStdX:** FFT body acceleration standard deviation X axis  
1. **fBodyAccStdY:** FFT body acceleration standard deviation Y axis  
1. **fBodyAccStdZ:** FFT body acceleration standard deviation Z axis  
1. **fBodyAccJerkMeanX:** FFT body acceleration Jerk signal mean X axis  
1. **fBodyAccJerkMeanY:** FFT body acceleration Jerk signal mean Y axis  
1. **fBodyAccJerkMeanZ:** FFT body acceleration Jerk signal mean Z axis  
1. **fBodyAccJerkStdX:** FFT body acceleration Jerk signal standard deviation X axis  
1. **fBodyAccJerkStdY:** FFT body acceleration Jerk signal standard deviation Y axis  
1. **fBodyAccJerkStdZ:** FFT body acceleration Jerk signal standard deviation Z axis  
1. **fBodyGyroMeanX:** FFT body gyroscope mean X axis  
1. **fBodyGyroMeanY:** FFT body gyroscope mean Y axis  
1. **fBodyGyroMeanZ:** FFT body gyroscope mean Z axis  
1. **fBodyGyroStdX:** FFT body gyroscope standard deviation X axis  
1. **fBodyGyroStdY:** FFT body gyroscope standard deviation Y axis  
1. **fBodyGyroStdZ:** FFT body gyroscope standard deviation Z axis  
1. **fBodyAccMagMean:** FFT body acceleration magnitude mean  
1. **fBodyAccMagStd:** FFT body acceleration magnitude standard deviation  
1. **fBodyBodyAccJerkMagMean:** FFT body acceleration Jerk signal magnitude mean  
1. **fBodyBodyAccJerkMagStd:** FFT body acceleration Jerk signal magnitude standard deviation  
1. **fBodyBodyGyroMagMean:** FFT body gyroscope magnitude mean  
1. **fBodyBodyGyroMagStd:** FFT body gyroscope magnitude standard deviation  
1. **fBodyBodyGyroJerkMagMean:** FFT body gyroscope Jerk signal magnitude mean  
1. **fBodyBodyGyroJerkMagStd:** FFT body gyroscope Jerk signal magnitude standard deviation  

## Variables Units

The original measures units were:
* *standard gravity units 'g'* for all the acceleration signals.
* *radians/second* for all the angular velocity vector measured by the gyroscope.

After that, all the observations are normalized and bounded within [-1,1]

