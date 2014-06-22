Getting and Cleaning Data
=========================

Course Project
--------------
This GitHub was set up as part of the project for the Getting and Cleaning Data course presented by Coursera.

Packages
--------
In order to run the script you will need the following package:
library(reshape2)

Data File
---------
The data file must be available in the working directory and can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Script
------
The script used to clean the data is run_analysis.R and can be downloaded.

Data Processing
---------------
The script specification as per the course document is:
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

I took the liberty to change the sequence a little but the end result is still the same.

* Load the activity labels for later use 
* Load the features to use it as labels for the final data set
* Clean the labels. As per point 2 I've only used labels which contain mean() and std() as part of the feature
* Load the datasets
* Merged the datasets by using the rbind function
* Only keep the tables needed for the tidy dataset
* Add the labels
* Merge the activity labels with the activity code
* Create the tidy file












         - how I processed the data
        - what assumptions I made
        - why I did things a certain way
        - who and where did I obtain original data