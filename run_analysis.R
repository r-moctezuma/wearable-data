## Human Activity Recognition Using Smartphones Dataset Analysis
## File: run_analysis.R
## Author: Roberto Moctezuma

# load packages
library(dplyr)
library(tidyr)

## Make sure the UCI HAR Dataset is unzipped in the current directory

## 1. Merges the training and the test sets to create one data set.
train <- read.fwf('./UCI HAR Dataset/train/X_train.txt', rep(16,561))
test  <- read.fwf('./UCI HAR Dataset/test/X_test.txt', rep(16,561))
alldata <- rbind(train,test)

## 2. Extracts only the measurements on the mean and standard deviation for each activity measurement.
features <- read.delim("./UCI HAR Dataset/features.txt", sep=" ", header = FALSE, stringsAsFactors = FALSE)
alldata <- alldata[,grepl("mean",features$V2) | grepl("std", features$V2)]

## 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.delim("./UCI HAR Dataset/activity_labels.txt", sep=" ", stringsAsFactors = FALSE, header = FALSE, col.names = c('activity','activityLabel'))
train_activity <- read.csv("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE, header = FALSE, col.names = c('activity'))
test_activity <- read.csv("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE, header = FALSE, col.names = c('activity'))
all_activity <- merge(rbind(train_activity,test_activity), activity_labels, all = TRUE)
alldata <- cbind(all_activity$activityLabel,alldata)

## 4. Appropriately labels the data set with descriptive variable names.
names(alldata) <- c("Activity", features$V2[features$V2 %in% c(grep("mean",features$V2, value = TRUE), grep("std", features$V2, value = TRUE))])

# Clean up
rm(list=c('all_activity','features','test','test_activity','train','train_activity','activity_labels'))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load the subject data
train_subject <- read.csv("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, header = FALSE, col.names = c('Subject'))
test_subject <- read.csv("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, header = FALSE, col.names = c('Subject'))
# Summarize by subject and activity to calculate the mean
summary_data <- cbind(rbind(train_subject, test_subject), alldata) %>%
	group_by(Activity, Subject) %>%
	summarise_each(funs(mean))

# Clean up
rm(list=c('train_subject','test_subject'))

## Write the resulting dataset to a file

write.table(summary_data, file = "HAR_tidy.txt",  row.names = FALSE)


