library(data.table)
library(reshape2)

## Define las columnas a extraer de ambas tablas
columns <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,517,517,529,530,542,543)

## Lee los datos del fichero entrenamiento
trainData <- read.table("./UCI HAR Dataset//train/X_train.txt")
trainSubject <- read.table("./UCI HAR Dataset//train/subject_train.txt")
trainSport <- read.table("./UCI HAR Dataset//train/y_train.txt")
trainData <- trainData[,columns]
trainData <- cbind(trainSubject, trainSport, trainData)

## Lee los datos del fichero test
testData <- read.table("./UCI HAR Dataset//test/X_test.txt")
testSubject <- read.table("./UCI HAR Dataset//test/subject_test.txt")
testSport <- read.table("./UCI HAR Dataset//test/y_test.txt")
testData <- testData[,columns]
testData <- cbind(testSubject, testSport, testData)

## Unir las dos con rbind
##train<-merge.data.frame(train,test, all=TRUE)
tidyData <- rbind(trainData, testData)

rm("trainData","trainSport","trainSubject")
rm("testData","testSport","testSubject")

## Cargar los nombres de las columnas y filtrar solo los elementos que nos interesan
col_names <- read.table("./UCI HAR Dataset//features.txt")
## col_names<-col_names[columns,2]
col_names <- c("subject", "sport", as.character(col_names[columns,2]))

## Limpiar los nombres de las columnas
charToRemove <- c( "-", "\\(", "\\)" )
for (k in charToRemove) col_names <- gsub(k,"",col_names)
col_names <- chartr("mean", "Mean", col_names)
col_names <- chartr("std", "Std", col_names)

## Asignar los nombres de las features a las columnas de la tabla.
colnames(tidyData) <- col_names
rm("charToRemove","columns","k")

## Reemplazar los valores de la columna 'sport' por sus descripciones
sport_names <- read.table("./UCI HAR Dataset/activity_labels.txt")
tidyData$Sport <- factor(tidyData$Sport, levels= 1:6, labels = sport_names[,2])


## Tabla sumario
summaryData <- aggregate(tidyData[,3:ncol(tidyData)], by = list(tidyData$Subject, tidyData$Sport), FUN = "mean")
colnames(summaryData) <- col_names
rm("col_names","sport_names")