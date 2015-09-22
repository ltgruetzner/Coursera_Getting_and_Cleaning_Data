# Coursera_Getting_and_Cleaning_Data
Course Project for Coursera Course "Getting and Cleaning Data"

==================================================================
Information on script „run_analysis.R“
==================================================================
Laura Gruetzner, 22 Sep 2015
==================================================================
The script will need to read the files
- x_test.txt
- y_test.txt
- subject_test.txt
- x_train.txt
- y_train.txt
- subject_train.txt
- features.txt
directly from the working directory (no subfolders)

The script will then do the following:

- read and merge x_test.txt, y_test.txt and subject_test.txt
- read and merge x_train.txt, y_train.txt and subject_train.txt
- merge the resulting two data sets
- read names of features and select only measurements on mean and std from data set
- add descriptive names for activities
- create new data set with the average of each variable for each activity and each subject
- write this new set (called „tidy.txt“)

