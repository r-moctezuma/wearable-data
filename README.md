## Human Activity Recognition Using Smartphones Dataset Analysis

This repository contains the script run_analysis.R that is used to process the Human Activity Recognition
data and generate a tidy dataset with the averages of the mean() and std() measures from the original data,
grouped by subject and activity type.

To run the script, follow these steps:

1. Download the original data from the project from this link:
	 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzipping the downloaded file will generate the directory "UCI HAR Dataset"
3. Place this directory in the same working directory as the run_analysis.R script
4. Run the script.

The script will create a new file, HAR_tidy.txt, which will contain the result of the analysis.

For a description of the HAR_tidy.txt dataset, please refer to the file CodeBook.md.

### Script functionality:

The script performs the following steps:

1. Loads the required packages (dplyr and tidyr)
2. Loads the training and test datasets and merges them into one set
3. Extracts from the combined dataset the variables related to the mean and standard deviation
4. Reads the activity labels and activity data sets
5. Uses the activity labels to insert descriptive activity names in the data set
6. Replaces the variable names in the dataset with descriptive variable names
7. Cleans up datasets no longer needed
8. Creates a second dataset with the average of each variable, grouped by activity and subject
9. Cleans up datasets no longer needed
10. Writes the resulting tidy dataset to a file.

