The run_analysis.R script is composed of the following functionality:

Begin First question section is to merge the training and the test sets to create one data set. It has sub steps as below:

step  1: Read Training Data tables, reads the training and its corresponding subject files.
step  2: Read Testing Data Table, reads the testing and its corresponding subject files.
step  3: Read the feature and activity label files
step  4: merges the training and testing tidy data sets into one and name it as merge.

#begin second question extract mean and sd is to extract only the measurements on the mean and standard deviation for each measurement in merge.


#third question descriptive activity names is designed to appropriately label the data set activitynames with descriptive variable names taken from the features.txt file.

#fourth question descriptive variable Names to assign a descriptive activity name for every activity in the activitynames.


#fifth question second Tidy Set is to create a second, independent tidy data set with the average of each variable for each activity and each subject using the dataset that was produced in 4.