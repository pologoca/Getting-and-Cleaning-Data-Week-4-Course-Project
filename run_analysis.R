# run_analysis.R
# Leopoldo Gómez Caudillo
# Getting and Cleaning Data, Course Project
# February 2021

# load packages
library(data.table)
library(dplyr)

# set the working directory
setwd('C:/Users/Leopoldo/Documents/DataScience/GetCleanData/CourseProject/')

# download zip data file from the web
urlFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(urlFile, destfile='dataset.zip', mode='wb')

# unzip dataset.zip file
unzip('dataset.zip')

# show the files
list.files('./UCI HAR Dataset/', recursive=T)

# set the path files
dataPath <- file.path('./UCI HAR Dataset/')

# read training datasets
x_train <- read.table(file.path(dataPath, 'train', 'X_train.txt'), header=F)
y_train <- read.table(file.path(dataPath, 'train', 'y_train.txt'), header=F)
subject_train <- read.table(file.path(dataPath, 'train', 'subject_train.txt'), header=F)

# read test datasets
x_test <- read.table(file.path(dataPath, 'test', 'X_test.txt'), header=F)
y_test <- read.table(file.path(dataPath, 'test', 'y_test.txt'), header=F)
subject_test <- read.table(file.path(dataPath, 'test', 'subject_test.txt'), header=F)

# read features file
variable_names <- read.table(file.path(dataPath, 'features.txt'), header=F)

# read activity labels file
activity_names <- read.table(file.path(dataPath, 'activity_labels.txt'), header=F)

# 1. Merge training and test data sets to create one data set

# 1a. merging training data
train <- cbind(subject_train, y_train, x_train)

# 1b. merging test data
test <- cbind(subject_test, y_test, x_test)

# 1c. join training and test objects
train_test_data <- rbind(train, test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.

# 2a. assign variable names to new data set "train_test_data". 
colnames(train_test_data) <- c('subject', 'activity', array(variable_names[, 2]))

# 2b. get all variables with "mean" and "std" in the name and their corresponding activity and subject
mean_and_std_data <- train_test_data[, grepl('subject', colnames(train_test_data)) | grepl('activity', colnames(train_test_data)) | grepl('mean', colnames(train_test_data)) | grepl('std', colnames(train_test_data))]

# 3. Use descriptive activity names to rename the activities in the new data set "mean_and_std_data"
mean_and_std_data$activity <- factor(mean_and_std_data$activity, labels=as.character(activity_names[,2]))

# 4. Appropriately label the data set with descriptive variable names.
# SEE THE STEP 2a.

# 5. From the data set in step 4, create a second, independent tidy data set with the average
# of each variable for each activity and each subject.

# 5a. To construct the mean of all features by subject and activity.
mean_subject_activity <- aggregate(.~subject+activity, mean_and_std_data, mean)

# 5b. To obtain the tidy data table with the mean by subject and activity.
tidy_data_set <- mean_subject_activity[order(mean_subject_activity$subject, mean_subject_activity$activity),]

# 5c. To create the file with the tidy data.
write.table(tidy_data_set, 'tidyDataSet.txt', row.names=F, col.names=T)
