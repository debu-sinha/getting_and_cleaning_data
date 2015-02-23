
## Transformation details

The script run-analysis.R needs to perform these five functions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


A

## How ```run_analysis.R``` implements the above steps:
* Require ```reshape2``` and ```dplyr``` libraries.
* Load the features and activity labels.
* Load and combine both test and train data.
* Extract the mean and standard deviation column names and data.
* Assign approprite labels to columns extracted.
* Merge the features dataset with activity label and subject datasets.
* Calculate mean value of features grouped by activity and subject.
* Associate activity names with the acitivityId and convert the transformed dataset into long format.
* Write tidy dataset to file submit.txt in UCI HAR Dataset directory.


Assumption is that run_analysis.R will be in same working directory as the unzipped data file from source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Initially it will set the working directory to ./UCI HAR Dataset directory.