# Getting and Cleaning Data Course Project

## The Raw data

The raw data are several dataset collected from the accelerometers from the Samsung Galaxy S smartphone.  
A group of 30 volunteers have been recording accelerometers and gyroscope values while they were practicing six differents activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  
Two datasets were recorded, one during a test period and other one during a training period.  
After that, the recorded have been processed in order to obtain several statystics mesures of the raw accelerometers and gyroscope datasets.  
The data is packaged in a Zip file and can be downloaden from the next link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
After the files are unzipped you must have the following files and directories structure.  

 *  **UCI HAR Dataset** ``Data  root directory``   
    + **test**  ``Contain the test data files``  
        - **Inertial Signals** ``Sensors raw data. Not used in this project``  
        - *subject\_test.txt*   ``Indentify the subject who practise the sport in each observation``    
        - *X\_test.txt*  ``Stores all the proccessed observation taken during the test periods``  
        - *y\_test.txt*  ``Identify the sport that is being practiced in each observation``  
    + **train**  ``Sensors raw data. Not used in this project``   
        - **Inertial Signals**  ``Sensors raw data. Not used in this project``     
        - *subject\_train.txt*  ``Indentify the subject who practise the sport in each orservation``     
        - *X\_train.txt*  ``Stores all the proccessed observation taken during the train periods``    
        - *y\_train.txt*   ``Identify the sport that is being practiced in each observation``  
    + *activity_labels.txt*  ``Stores the description for each value represented in the y\_*.txt files``   
    + *features.txt*  ``Stores the labels for all the variables in the X\_*.txt files``   
    + *features_info.txt*  ``A description about the features stored in the datasets``   
    + *README.txt*  ``A further description about all the experiment``   

More information about the raw data can be obtained in the *README.txt* file contained in the zip file.  

## The datasets variables

The course project requests that only the measurements on the mean and standard deviation for each measurement must be extracted. And furthermore the labels must be transformed into more appropiate ones.  
All the variables labels in the generated tables are based in the originals ones. Specials characters like '-', '\(' or '\)' have been removed. In adition the "mean" and "std" strings have been changed with "Mean" and "Std" in order to obtain more readable ones (low Camel) instead of all lowcase ones.  
The original variables can be founded in the *features.txt* file contained in the raw dataset.  
Both generated tables have the following variables:

* **subject:** Subject who practiced the activitie  
* **sport:**  Activitie that was being practiced  
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

## Variables units

The original measures units were:
* *standard gravity units 'g'* for all the acceleration signals.
* *radians/second* for all the angular velocity vector measured by the gyroscope.

After that, all the observations are normalized and bounded within [-1,1]

