The run_analysis.R script performs the 5 steps required as described in the course project deliverables.

Download the dataset
Dataset downloaded and extracted.

Assign each data to variables
x_train <- train/x_train.txt : 7352 rows, 561 columns 
y_train <- train/y_train.txt : 7352 rows, 1 columns 
sub_train <- train/subject_train.txt : 7352 rows, 1 column 
x_test <- test/X_test.txt : 2947 rows, 561 columns 
y_test <- test/y_test.txt : 2947 rows, 1 columns 
sub_test <- test/subject_test.txt : 2947 rows, 1 column 
feature <- features.txt : 561 rows, 2 columns 
activitylabels <- activity_labels.txt : 6 rows, 2 columns 

Merges the training and the test sets to create one data set
merge_train (7352 rows, 563 columns) is created by merging y_train, sub_train and x_train using cbind() function
merge_test (2947 rows, 561 columns) is created by merging y_test, sub_test and x_test using cbind() function
merge (10299 rows, 563 column) is created by merging merge_train and merge_test using rbind() function

Extracts only the measurements on the mean and standard deviation for each measurement
meanandsd (10299 rows, 63 columns) is created by subsetting merge, selecting only columns: subject, activityand the measurements on the mean and standard deviation (std) for each measurement

Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the merge replaced with corresponding activity taken from activities variable

Appropriately labels the data set with descriptive variable names
All Acc in column’s name replaced by Accelerometer
All Mag in column’s name replaced by Magnitude
All Gyro in column’s name replaced by Gyroscope
All start with character t in column’s name replaced by Time
All start with character f in column’s name replaced by Frequency
All BodyBody in column’s name replaced by Body

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
TidySet (180 rows, 64 columns) is created by sumarizing TidySet taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Write the TidySet to TidySet.txt.


README
Peer-graded Assignment: Getting and Cleaning Data Course Project
This repository is a Nunno Nugroho submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.

Dataset
Human Activity Recognition Using Smartphones

Files
CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

run_analysis.R performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData.txt is the exported final data after going through all the sequences described above.