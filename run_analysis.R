#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

read.table("UCI_HDR_Dataset/test/subject_test.txt") -> subject_test
read.table("UCI_HDR_Dataset/test/X_test.txt") -> X_test
read.table("UCI_HDR_Dataset/test/y_test.txt") -> y_test
read.table("UCI_HDR_Dataset/train/subject_train.txt") -> subject_train
read.table("UCI_HDR_Dataset/train/X_train.txt") -> X_train
read.table("UCI_HDR_Dataset/train/y_train.txt") -> y_train
read.table("UCI_HDR_Dataset/activity_labels.txt") -> activity_lables
read.table("UCI_HDR_Dataset/features.txt") -> features

cbind(subject_test,y_test,X_test) -> test
cbind(subject_train,y_train,X_train) -> train
rbind(train,test) -> HAR
names(HAR) <- c("subject","lable",as.character(features$V2))

