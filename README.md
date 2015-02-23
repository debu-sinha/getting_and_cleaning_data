
## Transformation details

The script run-analysis.R needs to perform these five functions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



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

# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The data source

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information


## The data

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

DATA DICTIONARY - submit.txt

 [1] "subject" numeric
	1:30
	One of 30 people who participated in the gathering of this dataset
 

 [2] "activityName"	character
	"WALKING"
	"WALKING_UPSTAIRS"
	"WALKING_DOWNSTAIRS"
	"SITTING"
	"STANDING"
	"LAYING"

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

 [3] "feature" character
    "tBodyAcc-mean()-X"          
     "tBodyAcc-mean()-Y"          
     "tBodyAcc-mean()-Z"          
     "tBodyAcc-std()-X"           
     "tBodyAcc-std()-Y"           
     "tBodyAcc-std()-Z"           
     "tGravityAcc-mean()-X"       
     "tGravityAcc-mean()-Y"       
     "tGravityAcc-mean()-Z"       
     "tGravityAcc-std()-X"        
     "tGravityAcc-std()-Y"        
     "tGravityAcc-std()-Z"        
     "tBodyAccJerk-mean()-X"      
     "tBodyAccJerk-mean()-Y"      
     "tBodyAccJerk-mean()-Z"      
     "tBodyAccJerk-std()-X"       
     "tBodyAccJerk-std()-Y"       
     "tBodyAccJerk-std()-Z"       
     "tBodyGyro-mean()-X"         
     "tBodyGyro-mean()-Y"         
     "tBodyGyro-mean()-Z"         
     "tBodyGyro-std()-X"          
     "tBodyGyro-std()-Y"          
     "tBodyGyro-std()-Z"          
     "tBodyGyroJerk-mean()-X"     
     "tBodyGyroJerk-mean()-Y"     
     "tBodyGyroJerk-mean()-Z"     
     "tBodyGyroJerk-std()-X"      
     "tBodyGyroJerk-std()-Y"      
     "tBodyGyroJerk-std()-Z"      
     "tBodyAccMag-mean()"         
     "tBodyAccMag-std()"          
     "tGravityAccMag-mean()"      
     "tGravityAccMag-std()"       
     "tBodyAccJerkMag-mean()"     
     "tBodyAccJerkMag-std()"      
     "tBodyGyroMag-mean()"        
     "tBodyGyroMag-std()"         
     "tBodyGyroJerkMag-mean()"    
     "tBodyGyroJerkMag-std()"     
     "fBodyAcc-mean()-X"          
     "fBodyAcc-mean()-Y"          
     "fBodyAcc-mean()-Z"          
     "fBodyAcc-std()-X"           
     "fBodyAcc-std()-Y"           
     "fBodyAcc-std()-Z"           
     "fBodyAccJerk-mean()-X"      
     "fBodyAccJerk-mean()-Y"      
     "fBodyAccJerk-mean()-Z"      
     "fBodyAccJerk-std()-X"       
     "fBodyAccJerk-std()-Y"       
     "fBodyAccJerk-std()-Z"       
     "fBodyGyro-mean()-X"         
     "fBodyGyro-mean()-Y"         
     "fBodyGyro-mean()-Z"         
     "fBodyGyro-std()-X"          
     "fBodyGyro-std()-Y"          
     "fBodyGyro-std()-Z"          
     "fBodyAccMag-mean()"         
     "fBodyAccMag-std()"          
     "fBodyBodyAccJerkMag-mean()" 
     "fBodyBodyAccJerkMag-std()"  
     "fBodyBodyGyroMag-mean()"    
     "fBodyBodyGyroMag-std()"     
     "fBodyBodyGyroJerkMag-mean()"
	 "fBodyBodyGyroJerkMag-std()"

[4] "value" numeric
 ALL Data presented in file is a MEAN of the original input data, grouped by activityName & subject 


