library(data.table)

## Define las columnas a extraer de ambas tablas
columns<-c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,517,517,529,530,542,543)

## Lee los datos del fichero entrenamiento
data1<-read.table("./UCI HAR Dataset//train/X_train.txt")
data1<-data1[,columns]

## Lee los datos del fichero test
data2<-read.table("./UCI HAR Dataset//test/X_test.txt")
data2<-data2[,columns]

## Unir las dos con merge
data1<-merge.data.frame(data1,data2, all=TRUE)

## Cargar los nombres de las columnas y filtrar solo los elementos que nos interesan
col_names<-read.table("./UCI HAR Dataset//features.txt")
col_names<-col_names[columns,2]

## Asignar los nombres de las features a las columnas de la tabla.