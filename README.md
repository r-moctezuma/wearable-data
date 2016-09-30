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



