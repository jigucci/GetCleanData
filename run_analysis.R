library(reshape2)
library(plyr)

wd<-getwd() # where directory 'UCI HAR Dataset' resides
root="UCI HAR Dataset" #where test/train directory is located

featureFile<-paste(wd,root,"features.txt",sep="\\")
feature561<-read.table(featureFile)
names(feature561)<-c("featureID","featureName")

#read 'activity_labels.txt' file
actFile<-paste(wd,root,"activity_labels.txt",sep="\\")
activity6<-read.table(actFile)
names(activity6)<-c("activityID","Activity")
activity6$Activity<-as.character(activity6$Activity)

subDir<-c("test","train")
filePre<-c("subject_","X_","y_")

#only retrieve features contain "-mean" or "-std" in feature561
Filteredfeature561_1<-feature561[grepl("-mean|-std",ignore.case=T,feature561$featureName),]
#remove "-meanF" features
Filteredfeature561<-Filteredfeature561_1[!grepl("-meanF",ignore.case=T,Filteredfeature561_1$featureName),]

# use function to pre-process data in train/test folder to get corresponding melted dataset
# for X_train/X_test raw data
preProcess<-function(subD) {
      
      LocationY<-paste(wd,root,subD,paste(paste(filePre[3],subD,sep=""),"txt",sep="."),sep="\\")
      ReadY<-read.table(LocationY)
      names(ReadY)<-c("ID")
      # for label file "Y_", add matching real activity name
      ReadY[c("Activity")]<-"n"
      
      for(i in 1:nrow(ReadY)){
            ReadY[i,2]<-activity6[ReadY[i,1],2]
      }
      newY<-ReadY
      
      #read subject_ file
      LocationSub<-paste(wd,root,subD,paste(paste(filePre[1],subD,sep=""),"txt",sep="."),sep="\\")
      ReadSub<-read.table(LocationSub)
      names(ReadSub)<-c("Subject")


      #read X_ dataset
      LocationXDataset<-paste(wd,root,subD,paste(paste(filePre[2],subD,sep=""),"txt",sep="."),sep="\\")
      ReadXDataset<-read.table(LocationXDataset)
      names(ReadXDataset)<-feature561$featureName


      #only retrieve features contain "-mean" or "-std"
      ReadXDatasetFiltered1<-ReadXDataset[,grepl("-mean|-std",ignore.case=T,names(ReadXDataset))]
      #remove "-meanF" features
      ReadXDatasetFiltered<-ReadXDatasetFiltered1[,!grepl("-meanF",ignore.case=T,names(ReadXDatasetFiltered1))]
      
      ##merge with subject & Activity 
      XDataset<-cbind(Subject=ReadSub$Subject,Activity=newY$Activity,ReadXDatasetFiltered)

      #Melting dataset
      XDatasetMelted<-melt(XDataset,id=c("Subject","Activity"),measure.vars=Filteredfeature561$featureName)
      return(XDatasetMelted)
}

##Please note: subDir<-c("test","train")
testDatasetMelted<-preProcess(subDir[1])
trainDatasetMelted<-preProcess(subDir[2])
#get the final merged dataset
ALLDatasetMelted<-rbind(testDatasetMelted,trainDatasetMelted )

avgALLDatasetMelted<-ddply(ALLDatasetMelted,.(Subject,Activity,variable),summarize,mean=round(mean(value),8))
 write.table(avgALLDatasetMelted,"tidyDataset_Avg.txt", row.name=F)


      