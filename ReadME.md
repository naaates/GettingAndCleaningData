# Data Cleaning Project Markdown

## Dataset Description: 

Human Activity Recognition Using Smartphones Dataset
Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

A full description is available at the site where the data was obtained:

[Dataset Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

Here are the data for the project:

[Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

## Given Information:
* 10299 instances
* 70% training, 30% testing
* 561 features
* 30 subjects - 30 volunteers
* 6 Activity types - (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

## Part Descriptions:

### Part 1
* The text files of the datasets were read 
* Test and training sets were merged to create one data set.
* x contains the 
* y contains the Activity ids
* Subjects contains the subject data

### Part 2
* The features.txt was read. 
* Features with "mean()" and "std()" keywords in them were extracted
* These features are to be used as column names in part 4

### Part 3
* The activity_labels.txt was read.
* Activity codes in the y dataset were matched with their corresponding labels.

### Part 4
* Only the mean and std datasets were extracted from the x dataset by using the index values of the extracted features
* The features were then used as column names for the x dataset.
* A dataset named "MergedDataset" was then created as a compilation of x, y and Subjects dataset.

### Part 5
* From the data set in step 4, a second, independent tidy data set was made 
* This dataset named "NewDataset" has the average of each variable for each activity and each subject.
* The new and tidy dataset was then written as a txt file named "New_Tidy_Dataset.txt"
