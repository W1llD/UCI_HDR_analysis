#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)

read.table("UCI\ HAR\ Dataset/activity_labels.txt") -> activity_lables
read.table("UCI\ HAR\ Dataset/features.txt") -> features
read.table("UCI\ HAR\ Dataset/test/subject_test.txt") -> subject_test
read.table("UCI\ HAR\ Dataset/test/X_test.txt") -> X_test
read.table("UCI\ HAR\ Dataset/test/y_test.txt") -> y_test
read.table("UCI\ HAR\ Dataset/train/subject_train.txt") -> subject_train
read.table("UCI\ HAR\ Dataset/train/X_train.txt") -> X_train
read.table("UCI\ HAR\ Dataset/train/y_train.txt") -> y_train

cbind(subject_test,y_test,X_test) -> test
cbind(subject_train,y_train,X_train) -> train
rbind(train,test) -> HAR

gsub("[()]","",features$V2) -> features$V2
names(HAR) <- c("subject","lable",as.character(features$V2))
rm(subject_test,y_test,X_test,subject_train,y_train,X_train,test,train)

HAR[,c(1,2,grep('mean[^F]|std',names(HAR)))] %>% mutate(activity = as.character(activity_lables[lable,2])) %>% select(c(1,60,3:59))-> HAR
HAR %>% group_by(activity,subject) %>% 
