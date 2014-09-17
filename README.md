# Cleaning Data Course Project

## The raw data
The raw data contains 561 unlabeled features along with subject and activity identifiers.

features.txt - Contains labels for the features.  
X_train.txt & X_test.txt - Contains the accelerometer and gyrosope measures for the subjects and activities.  
subject_train.txt & subject_test.txt - Contains a vector of numbers (1-30) that correspond to the test subject.
y_train.txt & y_test.txt - Contains a vector of numbers (1-6) that correspond to the activity performed by each subject.

## The run_analysis.R script

   1. Reads the UCI HAR data tables into R.
   2. Binds the data tables.
   3. Gives the activity numbers (1-6) descriptive lables.
   4. Changes the activity class from character to factor.
   5. Excludes features that do not contain mean() or std().
   6. Melts the data set into a long table.
   7. Calculates the average measurement for each signal by subject and activity.
   8. Writes a .txt file of the data table to the working directory.

To read the data table back into R, use the command read.table("./HAR_tidy.txt", header = TRUE).

## Codebook for the tidy dataset
The repo contains a codebook titled CODEBOOK.md


