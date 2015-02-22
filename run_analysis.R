setwd("./UCI\ HAR\ Dataset")
library(dplyr)
library(reshape2)
##Read table headers
##activity labels | obs : 6   | V :2
activity_labels<-read.table("./activity_labels.txt",stringsAsFactors=FALSE)
##feature labels | Obs : 561  | V : 2 
feature_labels<-read.table("./features.txt",stringsAsFactors=FALSE)


##Read Test data
##X_test | Obs : 2947 | V : 561
testDataset_X<-read.table("./test/X_test.txt")
##y_test | Obs : 2947 | V : 1 | range 1-5
testDataset_y<-read.table("./test/y_test.txt")
##subject_test | Obs : 2947 | V : 1 | range 1-30
testDataset_subject<-read.table("./test/subject_test.txt")

##Read Training data
##X_train | Obs : 7352 | V : 561
trainDataset_X<-read.table("./train/X_train.txt")
##y_train | Obs : 7352 | V : 1 | range 1-5
trainDataset_y<-read.table("./train/y_train.txt")
##subject_train | Obs : 7352 | V : 1 | range 1-30
trainDataset_subject<-read.table("./train/subject_train.txt")

##Merge the datasets
##combine X/y/subject datasets seperately
combine_X=rbind(testDataset_X,trainDataset_X)
combine_y=rbind(testDataset_y,trainDataset_y)
combine_subject=rbind(testDataset_subject,trainDataset_subject)

##Extract only the measurements on mean() and std() 

##get the column numbers containing std() and mean() from the feature_labels
col_num<- grep("(*mean\\(\\)|*std\\(\\))",feature_labels$V2,ignore.case=TRUE)
##extract only the std and mean columns from combine_X 
combine_mean_std<-combine_X[,col_num]

##Appropriately labels the data set combine_mean_std with descriptive variable names.
colnames(combine_mean_std)<-feature_labels$V2[col_num]
combined_dataset<-combine_mean_std

##bind dataset combine_y containing activity type
combined_dataset["activityId"]<-combine_y

##bind dataset combine_subject
combined_dataset["subject"]<-combine_subject

##Find mean of all variables in dataset grouped by subject and activityId
aggData<-aggregate(combined_dataset[,1:66],list(Activity = combined_dataset$"activityId",Subject = combined_dataset$"subject"),mean)

##assign appropriate name for the activity Id
aggData <- merge(x = aggData, y = activity_labels, by.x="Activity", by.y="V1")
aggData<-select(aggData, -(Activity))
aggData<-rename(aggData, c(V2 = "activityName"))

##convert data to long format
data.long <- melt(aggData,
                  # ID variables - all the variables to keep but not split apart on
                  id.vars=c("Subject","activityName"),
                  # The source columns
                  measure.vars=c(colnames(aggData[,2:67])),
                  # column that the measurement came from
                  variable.name="measurement"
                )

write.table(data.long,"./submit.txt")
