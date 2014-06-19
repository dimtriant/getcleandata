#Coursera Getting and Cleaning Data
##Course Project

This README file is intended to guide you through the run_Analysis.R script.

Assumptions:
- The data is placed in the home directory that R recognizes
- The data is kept in the original folder system (UCI HAR Dataset)
- The main data measurements for the two samples are located in X_test and X_train
- The activity IDs corresponding to each measurement in X_test and X_train are located in y_test and y_train respectively.
- The subject_test & subject_train datasets contain the index identifying the person who was performing the activity.
- All measurements, activities, People indices are assumed to be in the correct order.


Steps:
1.Read the data from the test and the train dataset
2.Read the activity & feature labels
3.Replace the temporary labels of the x_test and y_test with the actual activity labels. It has been assumed that the activity labels are in the correct order to match the data.
4.Rename the single columns of y_test & y_train into activity_ID to aid readability.
5.Rename the single columns of subject_test & subject_train into subject_ID to aid readability.
6.Combine the subject,y,x datasets into one dataset for each of test and train. The sequence has been chosen for readability.
7.Determine which columns contain the mean & stdev measurements. It has been assumed that all columns which have the words "mean" or "stdev" in their labels are relevant. That's regardless of the positioning of the words in the label.