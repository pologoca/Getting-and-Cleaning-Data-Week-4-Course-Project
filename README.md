---
title: "Getting and cleaning data course project"
author: "Leopoldo Gomez Caudillo"
date: "28/2/2021"
output: html_document
---
This repo was created to submit the course project of Getting and Cleaning Data course.

The next lines explains the script to get and clean data from "the Human Activity Recognition Using Smartphones Dataset Version 1.0" paper. The data used represent data collected from the acelerometers from the Samsung Galaxy S smartphone.

More information can be found at the data source website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Next two lines load data.table and dplyr packages:
```{r, echo = TRUE, eval = FALSE}
library(data.table)
library(dplyr)
```

First set the working directory with the "setwd" command. You must modify the path in accordance with your directory system. 
```{r, echo = TRUE, eval = FALSE}
setwd('C:/Users/Leopoldo/Documents/DataScience/GetCleanData/CourseProject/')
```

To down load the zip file. First, an object "UrlFile" was created with the electronic address of the files. With this object the "download.file" command is run.
```{r, echo = TRUE, eval = FALSE}
urlFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(urlFile, destfile='dataset.zip', mode='wb')
```

The zip file is unziped with the "unzip" command. Next, the "list.files" command is used to see the decompressed files and the path to these is set with the "file.path" command in the "dataPath" object, in order to work with these.
```{r, echo = TRUE, eval = FALSE}
unzip('dataset.zip')
list.files('./UCI HAR Dataset/', recursive=T)
dataPath <- file.path('./UCI HAR Dataset/')
```

The next step is to read the files to be worked with to obtain the final data table. The first three commands are to read the files with the training data, the next three to read the test data. And the last two to read the files with the names of the variables and activities respectively.
```{r, echo = TRUE, eval = FALSE}
x_train <- read.table(file.path(dataPath, 'train', 'X_train.txt'), header=F)
y_train <- read.table(file.path(dataPath, 'train', 'y_train.txt'), header=F)
subject_train <- read.table(file.path(dataPath, 'train', 'subject_train.txt'), header=F)

x_test <- read.table(file.path(dataPath, 'test', 'X_test.txt'), header=F)
y_test <- read.table(file.path(dataPath, 'test', 'y_test.txt'), header=F)
subject_test <- read.table(file.path(dataPath, 'test', 'subject_test.txt'), header=F)

variable_names <- read.table(file.path(dataPath, 'features.txt'), header=F)

activity_names <- read.table(file.path(dataPath, 'activity_labels.txt'), header=F)
```

### To meet the first goal: Merge training and test data sets to create one data set
First, keys of the subjects and activities and the values obtained for each variable were joined with the "cbind" command for the training and test data objects.
```{r, echo = TRUE, eval = FALSE}
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
```

Next, the training and test data objects were merged with the "rbind" command to construct one data set with training and test data.
```{r, echo = TRUE, eval = FALSE}
train_test_data <- rbind(train, test)
```

### To achieve the second goal: Extract only the measurements on the mean and standard deviation for each measurement
First, the variables of the object with complete data created in the first goal are named with the "colnames" command. The first column is the identifier of the subjects, the second is the identifier of the activities. The next columns are all the variables that were measured in subjects.
```{r, echo = TRUE, eval = FALSE}
colnames(train_test_data) <- c('subject', 'activity', array(variable_names[, 2]))
```

Next, the data set with only variables that contain "mean" or "std" was extracted from the object with complete data with the command "grepl".
```{r, echo = TRUE, eval = FALSE}
mean_and_std_data <- train_test_data[, grepl('subject', colnames(train_test_data)) | grepl('activity', colnames(train_test_data)) | grepl('mean', colnames(train_test_data)) | grepl('std', colnames(train_test_data))]
```

### To meet the third goal: Uses descriptive activity names to name the activities in the data set
The ids in the activity column of the object created in the previous goal, were assigned their labels with the object "activity_names" using the command "factor". It is very important to indicate that the labels are strings of letters with the command "as.character" with the option "labels" within the command "factor".
```{r, echo = TRUE, eval = FALSE}
mean_and_std_data$activity <- factor(mean_and_std_data$activity, labels=as.character(activity_names[,2]))
```

### Fourth goal: Appropriately labels the data set with descriptive variable names
#### NOTE
This goal was met in the first step of the second goal. Since it is much easier to select variables with the "grepl" command, when they already have a label assigned.

### Finally, to meet the fifth objective: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
An object with the mean by subject and activity was generated with the "aggregate" command. Then, the data within this object was sorted by subject and activity with the "order" command. Finally, the file "tidyDataSet.txt" with the tidy data was created with the command "write.table"
```{r, echo = TRUE, eval = FALSE}
mean_subject_activity <- aggregate(.~subject+activity, mean_and_std_data, mean)

tidy_data_set <- mean_subject_activity[order(mean_subject_activity$subject, mean_subject_activity$activity),]

write.table(tidy_data_set, 'tidyDataSet.txt', row.names=F, col.names=T)
```
