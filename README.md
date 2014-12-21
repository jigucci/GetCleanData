---
title: "README.md"
date: "Saturday, December 20, 2014"
output: html_document
---
### Get and Clean Data Project 
Class project for Coursera class on 'Getting and cleaning data using R'

### Description
This repo contains R code that downloads, reads, and summarizes a dataset. For details on the raw dataset of the analysis, see the CodeBook.md file.

### Details

#### Variable used and retrieved in this analysis
 
##### 1. Feature variables
The features used in the new dataset are main and standard deviation for each measurement. It is shown in the following table with descriptions. Please note the Feature ID is the original feature ID used in the source dataset. (note: datasets in ./Inertial Signals folder are not part of this analysis)

Feature ID  |    Feature Name              | Feature Description
----------- | ----------------        | ------------------
1           | tBodyAcc-mean()-X       |  Time domain body acceleration mean along X
2           |  tBodyAcc-mean()-Y      |  Time domain body acceleration mean along Y
3	      |  tBodyAcc-mean()-Z      |  Time domain body acceleration mean along Z
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
```
featureFile<-paste(wd,root,"features.txt",sep="\\")
feature561<-read.table(featureFile)
names(feature561)<-c("featureID","featureName")
```
    + Load activity_labels.txt and assign column names c("activityID","Activity"), convert factor type
      variable 'Activity' to character type and form dataframe 'activity6'.
```
actFile<-paste(wd,root,"activity_labels.txt",sep="\\")
activity6<-read.table(actFile)
names(activity6)<-c("activityID","Activity")
activity6$Activity<-as.character(activity6$Activity)
```
    + Define two vector variables that will be used in function 'PreProcess', namely subDir<-c("test","train") & filePre<-c("subject_","X_"
      ,"y_").
```
subDir<-c("test","train") 
filePre<-c("subject_","X_","y_")
```  
      
 2. Filter dataframe 'feature561' to maintain only main and standard deviation for each measurement and result in dataframe 'Filteredfeature561'. (see detailed 
    in the above table) There is a total of 66 features remained.
```
Filteredfeature561_1<-feature561[grepl("-mean|-std",ignore.case=T,feature561$featureName),]
Filteredfeature561<-Filteredfeature561_1[!grepl("-meanF",ignore.case=T,Filteredfeature561_1$featureName),]
```
 3. Define a PreProcess function that will be applied to both train & test dataset with the following procedures. The output from 
    it is melted Z dataset. (please note I will use Z dataset that represents either train or test dataset)
```
preProcess<-function(subD) {
```
    + Load activity file for Z dataset (prefix 'y_), assign corresponding detailed activity name (see 2. Activity above) for new column 'Activity' and result in 
      dataframe 'NewY'
```
LocationY<-paste(wd,root,subD,paste(paste(filePre[3],subD,sep=""),"txt",sep="."),sep="\\")
ReadY<-read.table(LocationY)
names(ReadY)<-c("ID")
ReadY[c("Activity")]<-"n"
for(i in 1:nrow(ReadY)){
      ReadY[i,2]<-activity6[ReadY[i,1],2]
      }
newY<-ReadY
```      
     
    + Load Subject file for Z dataset (prefix 'Subject_') for the Z dataset and assign column name 'Subject' to form dataframe 'ReadSub'
```
LocationSub<-paste(wd,root,subD,paste(paste(filePre[1],subD,sep=""),"txt",sep="."),sep="\\")
ReadSub<-read.table(LocationSub)
names(ReadSub)<-c("Subject")
```
    + Load raw Z dataset (prefix 'X_) and assign column names from 'featurename' of 'feature561'to form dataframe 'ReadXDataset'
```
LocationXDataset<-paste(wd,root,subD,paste(paste(filePre[2],subD,sep=""),"txt",sep="."),sep="\\")
ReadXDataset<-read.table(LocationXDataset)
names(ReadXDataset)<-feature561$featureName
```
    + Filter columns in dataframe 'ReadXDataset' to keep only main and standard deviation for each measurement and result in dataframe 'ReadXDatasetFiltered' (its column names is a perfect match with those of 'Filteredfeature561').
```
ReadXDatasetFiltered1<-ReadXDataset[,grepl("-mean|-std",ignore.case=T,names(ReadXDataset))]
ReadXDatasetFiltered<-ReadXDatasetFiltered1[,!grepl("-meanF",ignore.case=T,names(ReadXDatasetFiltered1))]
```
      
    + Merge 'ReadXDatasetFiltered' with ReadSub & newY vertically to form a complete dataframe 'XDataset'that includes subject/Activity 
      /Features.
```
XDataset<-cbind(Subject=ReadSub$Subject,Activity=newY$Activity,ReadXDatasetFiltered)
```
    + Melt 'XDataset' to form final tidy dataset dataframe 'XDatasetMelted'   
```
 XDatasetMelted<-melt(XDataset,id=c("Subject","Activity"),measure.vars=Filteredfeature561$featureName)
return(XDatasetMelted)
```
      
 4. Merge the two 'XDataset' (train&test) to get the final complete tidy dataset 'ALLDatasetMelted'
```
testDatasetMelted<-preProcess(subDir[1])
trainDatasetMelted<-preProcess(subDir[2])
ALLDatasetMelted<-rbind(testDatasetMelted,trainDatasetMelted )
```
 
 5. Get the average of each variable for each activity and each object and result in dataset 'avgALLDatasetMelted'
```
avgALLDatasetMelted<-ddply(ALLDatasetMelted,.(Subject,Activity,variable),summarize,mean=round(mean(value),8))
```
 
#### Export
  Export the final dataset to .txt file




