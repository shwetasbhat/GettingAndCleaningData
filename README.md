# GettingAndCleaningData

This project demonstrates the ability to collect, work with, and clean a data set that can be used for subsequent 
analysis.  A full description of the data used for this project is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data for the project is found here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file run_analysis.R does the following :

1. Downloads the zip file into a temp file, unzips and reads data into respective tables.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
activity and each subject.
