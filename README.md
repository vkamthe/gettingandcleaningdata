# gettingandcleaningdata
Coursera - Getting and cleaning data - Assignment
==================================================================
Dataset cleaned by Vikram Kamthe
Date - 2-September-2016
==================================================================

Original dataset was created using below data - The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This function gets and cleans the data related to Activity tracking of 30 subjects for 6 different Activities. Train DB has 7352 records and test DB has 2947 records making a total of 10299 records. Each of train and test DB has 3 files each with below columns - Y file has 1 column which is activity code between 1 to 6 for all records Subject file has 1 columns - subject code - indicating the subject performing the activity. Subject code is between 1 to 30. X file has 561 columns. Each column indicates a sensor reading for this record. The dataset has one record for each subject for each activty. Hence total records are 180.

The dataset includes the following files:
=========================================
- 'README.txt'
- 'summarydb.txt': Shows information about the variables used on the feature vector.
- 'Code Book.txt': Code Book for summaryDB dataset
- 'run_analysis.R': R code used to get and clean the data

How to read the dataset using R
===============================
data <- read.table("summarydb.txt", header = TRUE)
View(data)

License:
========
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
