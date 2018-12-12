if (!file.exists("./data")) {dir.create("./data")}
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./data/week4pro.zip")

#unzip data into /data dir

unzip(zipfile = "./data/week4pro.zip",exdir = "./data")

#Begin first question

#Step 1: Read Training Data tables

x_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
sub_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Step 2:  Read Testing Data Table

x_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
sub_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#step 3: Read Feature and Activity Labels
#Read Feature
feature<-read.table("./data/UCI HAR Dataset/features.txt")

#Read Activity Labels
activitylabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

#Name Columns

colnames(x_train)<-feature[,2]
colnames(y_train)<-"activityID"
colnames(sub_train)<-"subID"

colnames(x_test)<-feature[,2]
colnames(y_test)<-"activityID"
colnames(sub_test)<-"subID"

colnames(activitylabels)<-c('activityID','activityType')

#step 4: Merge Training and Test Data into one dataset(merge)

merge_train<-cbind(y_train,sub_train,x_train)
merge_test<-cbind(y_test,sub_test,x_test)
merge<-rbind(merge_train,merge_test)


#end of first quesion

#begin second question extract mean and sd

cnames<-colnames(merge)

mean_and_sd<-(grepl("activityID", cnames)| grepl("subID",cnames)|grepl("mean...",cnames)|grepl("std...",cnames))

meanandsd<-merge[,mean_and_sd==TRUE]

#end extract mean and sd

#third question descriptive activity names
activitynames<-merge(meanandsd,activitylabels,by='activityID',all.x=TRUE)
#end ativity names

#fourth question descriptive variable Names
names(activitynames)<-gsub("Acc","Accelerator",names(activitynames))
names(activitynames)<-gsub("Mag","Magnitude",names(activitynames))
names(activitynames)<-gsub("Gyro","Gyroscope",names(activitynames))
names(activitynames)<-gsub("^t","time",names(activitynames))
names(activitynames)<-gsub("f","frequency",names(activitynames))
names(activitynames)<-gsub("BodyBody","Body",names(activitynames))
#end descriptive variable names

#fifth question second Tidy Set

TidySet<-aggregate(. ~subID + activityID, activitynames, mean)
TidySet<-TidySet[order(TidySet$subID,TidySet$activityID),]

write.table(TidySet,"TidySet.txt",row.names = FALSE)
