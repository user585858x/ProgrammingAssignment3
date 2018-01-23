# ProgrammingAssignment3

## This is a read-me file describing the contents of user5858x/Programming Assignment3

The file run_analysis.R contains a script that reads in data from the UCI HAR dataset (found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and merges the testing and training observations into one dataset. It writes out two csv files - one containing all summary statistics for mean and standard deviation (tidy_data_mean_std.csv), and another containing only mean summary statistics (tidy_data_mean_only.csv).

## Here are the general procedures in run_analysis.R:
1. Import Data for test subjects
2. Import Data for train subjects
3. Merge testing data together 
4. Merge training data together
5. Row-bind testing and training data together
6. Modify variable names
7. Assign factor levels based on codebook
8. Extract mean summary statistics
9. Export tidy data

