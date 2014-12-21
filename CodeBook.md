---
title: "CodeBook"
date: "Saturday, December 20, 2014"
output: html_document
---


####Introduction

This file describes the data, the variables, and the work that has been performed inside run_analysis.R to clean up the data.

####Source Dataset Description

Here are the source data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

(A full description of source is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

######The data set includes the following files:

 * 'features_info.txt': Shows information about the variables used on the feature vector.
 
 * 'features.txt': List of all features.
 
 * 'activity_labels.txt': Links the class labels with their activity name.
 
 * 'train/X_train.txt': Training set.
 
 * 'train/y_train.txt': Training labels.
 
 * 'test/X_test.txt': Test set.
 
 * 'test/y_test.txt': Test labels.
 
 * 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
 
 * 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row  
   shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
   
 * 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
 
 * 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

#### Variable used and retrieved in this analysis  
 
##### 1. Feature variables
The features used in the new dataset are main and standard deviation for each measurement. It is shown in the following table with descriptions. Please note the Feature ID is the original feature ID used in the source dataset. (note: datasets in ./Inertial Signals folder are not part of this analysis)

Feature ID  |    Feature Name              | Feature Description
----------- | ----------------        | ------------------
1           | tBodyAcc-mean()-X       |  Time domain body acceleration mean along X
2           |  tBodyAcc-mean()-Y      |  Time domain body acceleration mean along Y
3            |  tBodyAcc-mean()-Z      |  Time domain body acceleration mean along Z
4	      |  tBodyAcc-std()-X |	Time domain body acceleration standard deviation along X
5	      | tBodyAcc-std()-Y |	Time domain body acceleration standard deviation along Y
6	      |  tBodyAcc-std()-Z |	Time domain body acceleration standard deviation along Z
41	|tGravityAcc-mean()-X	|Time domain gravity acceleration mean along X
42	|tGravityAcc-mean()-Y	|Time domain gravity acceleration mean along Y
43	|tGravityAcc-mean()-Z|	Time domain gravity acceleration mean along Z
44|	tGravityAcc-std()-X|	Time domain gravity acceleration standard deviation along X
45|	tGravityAcc-std()-Y|	Time domain gravity acceleration standard deviation along Y
46|	tGravityAcc-std()-Z|	Time domain gravity acceleration standard deviation along Z
81|	tBodyAccJerk-mean()-X|	Time domain body acceleration jerk mean along X
82|	tBodyAccJerk-mean()-Y|	Time domain body acceleration jerk mean along Y
83|	tBodyAccJerk-mean()-Z|	Time domain body acceleration jerk mean along Z
84|	tBodyAccJerk-std()-X|	Time domain body acceleration jerk standard deviation along X
85|	tBodyAccJerk-std()-Y|	Time domain body acceleration jerk standard deviation along Y
86|	tBodyAccJerk-std()-Z|	Time domain body acceleration jerk standard deviation along Z
121|	tBodyGyro-mean()-X|	Time domain body gyroscope mean along X
122|	tBodyGyro-mean()-Y|	Time domain body gyroscope mean along Y
123|	tBodyGyro-mean()-Z|	Time domain body gyroscope mean along Z
124|	tBodyGyro-std()-X	|Time domain body gyroscope standard deviation along X
125|	tBodyGyro-std()-Y	|Time domain body gyroscope standard deviation along Y
126|	tBodyGyro-std()-Z	|Time domain body gyroscope standard deviation along Z
161|	tBodyGyroJerk-mean()-X|	Time domain body gyroscope jerk mean along X
162|	tBodyGyroJerk-mean()-Y|	Time domain body gyroscope jerk mean along Y
163|	tBodyGyroJerk-mean()-Z|	Time domain body gyroscope jerk mean along Z
164|	tBodyGyroJerk-std()-X|	Time domain body gyroscope jerk standard deviation along X
165|	tBodyGyroJerk-std()-Y|	Time domain body gyroscope jerk standard deviation along Y
166|	tBodyGyroJerk-std()-Z|	Time domain body gyroscope jerk standard deviation along Z
201|	tBodyAccMag-mean()|	Time domain body acceleration magnitude mean
202|	tBodyAccMag-std()	|Time domain body acceleration magnitude standard deviation
214|	tGravityAccMag-mean()|	Time domain gravity acceleration magnitude mean
215|	tGravityAccMag-std()|	Time domain gravity acceleration magnitude standard deviation
227|	tBodyAccJerkMag-mean()|	Time domain body acceleration jerk magnitude mean
228|	tBodyAccJerkMag-std()|	Time domain body acceleration jerk magnitude standard deviation
240|	tBodyGyroMag-mean()|	Time domain body gyroscope magnitude mean
241|	tBodyGyroMag-std()|	Time domain body gyroscope magnitude  standard deviation
253|	tBodyGyroJerkMag-mean()	|Time domain body gyroscope jerk magnitude mean
254|	tBodyGyroJerkMag-std()|	Time domain body gyroscope jerk magnitude  standard deviation
266|	fBodyAcc-mean()-X	|Frequency domain body acceleration mean along X
267|	fBodyAcc-mean()-Y|	Frequency domain body acceleration mean along Y
268|	fBodyAcc-mean()-Z	|Frequency domain body acceleration mean along Z
269|	fBodyAcc-std()-X|	Frequency domain body acceleration standard deviation along X
270|	fBodyAcc-std()-Y|	Frequency domain body acceleration standard deviation along Y
271|	fBodyAcc-std()-Z|	Frequency domain body acceleration standard deviation along Z
345|	fBodyAccJerk-mean()-X|	Frequency domain body acceleration jerk mean along X
346|	fBodyAccJerk-mean()-Y|	Frequency domain body acceleration jerk mean along Y
347|	fBodyAccJerk-mean()-Z|	Frequency domain body acceleration jerk mean along Z
348|	fBodyAccJerk-std()-X|	Frequency domain body acceleration jerk standard deviation along X
349|	fBodyAccJerk-std()-Y|	Frequency domain body acceleration jerk standard deviation along Y
350|	fBodyAccJerk-std()-Z|	Frequency domain body acceleration jerk standard deviation along Z
424|	fBodyGyro-mean()-X|	Frequency domain body gyroscope mean along X
425|	fBodyGyro-mean()-Y|	Frequency domain body gyroscope mean along Y
426|	fBodyGyro-mean()-Z|	Frequency domain body gyroscope mean along Z
427|	fBodyGyro-std()-X	|Frequency domain body gyroscope standard deviation along X
428|	fBodyGyro-std()-Y	|Frequency domain body gyroscope standard deviation along Y
429|	fBodyGyro-std()-Z	|Frequency domain body gyroscope standard deviation along Z
503|	fBodyAccMag-mean()|	Frequency domain body acceleration magnitude mean
504|	fBodyAccMag-std()	|Frequency domain body acceleration magnitude standard deviation
516|	fBodyBodyAccJerkMag-mean()|	Frequency domain body acceleration jerk magnitude mean
517|	fBodyBodyAccJerkMag-std()|	Frequency domain body acceleration jerk magnitude standard deviation
529|	fBodyBodyGyroMag-mean()|	Frequency domain body gyroscope magnitude mean
530|	fBodyBodyGyroMag-std()|	Frequency domain body gyroscope magnitude  standard deviation
542|	fBodyBodyGyroJerkMag-mean()|	Frequency domain body gyroscope jerk magnitude mean
543|	fBodyBodyGyroJerkMag-std()|	Frequency domain body gyroscope jerk magnitude  standard deviation

##### 2. Activity
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

##### 3. Subject
A group of 30 volunteers is identified from 1~30.


#### Transformation (detailed script work is in README.md)
 1. Load dataset saved in ./UCI HAR Dataset directory.
    + Load feature.txt file and assign column names c("featureID","featureName") to form dataframe 'feature561'.
    + Load activity_labels.txt and assign column names c("activityID","Activity"), convert factor type
      variable 'Activity' to character type and form dataframe 'activity6'.
    + Define two vector variables that will be used in function 'PreProcess', namely subDir<-c("test","train") & filePre<-c("subject_","X_"
      ,"y_").     
      
 2. Filter dataframe 'feature561' to maintain only main and standard deviation for each measurement and result in dataframe 'Filteredfeature561'. (see detailed 
    in the above table) There is a total of 66 features remained.
    
 3. Define a PreProcess function that will be applied to both train & test dataset with the following procedures. The output from 
    it is melted Z dataset. (please note I will use Z dataset that represents either train or test dataset)
    + Load activity file for Z dataset (prefix 'y_), assign corresponding detailed activity name (see 2. Activity above) for new column 'Activity' and result 
      in dataframe 'NewY'.
    + Load Subject file for Z dataset (prefix 'Subject_') for the Z dataset and assign column name 'Subject' to form dataframe 'ReadSub'.
    + Load raw Z dataset (prefix 'X_) and assign column names from 'featurename' of 'feature561'to form dataframe 'ReadXDataset'.
    + Filter columns in dataframe 'ReadXDataset' to keep only main and standard deviation for each measurement and result in dataframe 'ReadXDatas  
      etFiltered' (its column names is a perfect match with those of 'Filteredfeature561').
    + Merge 'ReadXDatasetFiltered' with ReadSub & newY vertically to form a complete dataframe 'XDataset'that includes subject/Activity/Features
      .
    + Melt 'XDataset' to form final tidy dataset dataframe 'XDatasetMelted'. 
      
 4. Merge the two 'XDataset' (train&test) to get the final complete tidy dataset 'ALLDatasetMelted'.
 
 5. Get the average of each variable for each activity and each object and result in dataset 'avgALLDatasetMelted'.
 
#### Export
  Export the final dataset to .txt file
