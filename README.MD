---
title: "README.MD"
---


## Getting and Cleaning Data Projec by xmyyj001 , 2017/8/16

The class project for [Getting and Cleaning Data](https://www.coursera.org/course/getdata) was to read in the [Human Activity Recognition Using Smartphones dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The run_analysis.R script perform an analysis on the data set, and output a tidy data set.

### Dataset backgroud
The data in the "Human Activity Recognition Using Smartphones Dataset" have been taken from experiments carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### In the script run_analysis.R 
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

** Note: this script use dplyr package, using group_by and summarize_all functions. Maybe another way to accomplish the work too. Which is reshape2 package£¬by using melt and dcast functions.additional information about the variables, data and transformations in the CodeBook.MD file.

### The output of the R script 
At last, the output is a tidy data set, Meandata.csv.



