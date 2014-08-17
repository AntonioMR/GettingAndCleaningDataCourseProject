##################################################################
## File name: run_analysis.R
## 
## Author: Antonio Morales Ruiz
## Description: This R script is part of the Course Project for the  
## 	"Getting and Cleaning Data" course in the Coursera Data Science 
##	Specialization
##
## 	The script transforms data collected from several data files
## 	into one tidy dataset and  other dataset that summarizes this one. 
##
## 	The raw data can be downloaded from:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## 	and are expected to be available in a directory named  "UHI HAR Dataset"
## 	in the working directory where this script is executed	
##
## Inputs: No inputs are required except the raw data in the correct location
## Output: The script generates two kind of outputs
## 	tidyData and SummaryData datasets loaded in memory
##	tidyData.txt and SummaryData.txt files containing the datasets stored 
##	in the working directory
##
## For more information about the preparing process please read the README.md file
##
## Information about the columns meaning and tables description are available in the 
## CodeBook.md file 
##################################################################

## Imports necessary libraries
library(data.table)
library(reshape2)
library(stringr)

## Defines the columns that are going to be extracted from the raw data tables
columns <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)

## Reads 'train' data from the different files 
trainData <- read.table("./UCI HAR Dataset//train/X_train.txt")
trainSubject <- read.table("./UCI HAR Dataset//train/subject_train.txt")
trainSport <- read.table("./UCI HAR Dataset//train/y_train.txt")
## Considers only the desired columns in the dataset
trainData <- trainData[,columns]
## And merges the three data.table adding a 'subject' and 'sport' columns on the left side
trainData <- cbind(trainSubject, trainSport, trainData)

## Reads 'test' data from the different files
testData <- read.table("./UCI HAR Dataset//test/X_test.txt")
testSubject <- read.table("./UCI HAR Dataset//test/subject_test.txt")
testSport <- read.table("./UCI HAR Dataset//test/y_test.txt")
## Considers only the desired columns in the dataset
testData <- testData[,columns]
## And merges again into only one data.table
testData <- cbind(testSubject, testSport, testData)

## Merges the previous data.frames into one containing all the observations for test and train datasets
tidyData <- rbind(trainData, testData)

## Removes the non necessary variables
rm("trainData","trainSport","trainSubject")
rm("testData","testSport","testSubject")

## Columns names are loaded from the specified file in the provided raw data
col_names <- read.table("./UCI HAR Dataset//features.txt")
## and a description name for colums 1 and 2 are joined with the loaded ones
col_names <- c("subject", "sport", as.character(col_names[columns,2]))

## Now columns names are changed into better ones removing non deseables characters
charToRemove <- c( "-", "\\(", "\\)" )		## Characters to remove
for (k in charToRemove) col_names <- gsub(k,"",col_names)
## Other modifications necessary to the better understanding of the columns names
col_names <- str_replace(col_names,"mean", "Mean")
col_names <- str_replace( col_names, "std", "Std")

## assigns the label names to the columns in the data.frame
colnames(tidyData) <- col_names
rm("charToRemove","columns","k")

## Read sports description from the given file
sport_names <- read.table("./UCI HAR Dataset/activity_labels.txt")
## replaces the value in sport column by its description
tidyData$sport <- factor(tidyData$sport, levels= 1:6, labels = sport_names[,2])

## The tidy dataset is ready. Export it to a file
write.table(tidyData, "./tidyyData.txt", sep = ",", row.name=FALSE)

## Now create the summarized data set with the mean of every column taken by 'sport' type and 'subject'
summaryData <- aggregate(tidyData[,3:ncol(tidyData)], by = list(tidyData$subject, tidyData$sport), FUN = "mean")
colnames(summaryData) <- col_names
## assigns the columns labels again
rm("col_names","sport_names")

## The summarized dataset is ready. Export it to a file
write.table(summaryData, "./summaryData.txt", sep = ",", row.name=FALSE)
