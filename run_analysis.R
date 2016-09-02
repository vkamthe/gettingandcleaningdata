run_analysis <- function() {
        
# Train DB - total 7352 records, test DB - total 2947 records, total 10299 records
# Subject file - 1 columns - subject code performing the activity between 1 to 30
# Y file  - 1 columns - activity code between 1 to 6
# X file - 561 columns - each relating to a sensor reading
        
featurenames <- read.table("UCI HAR Dataset/features.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")

trainactivity <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainfeatures <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(trainactivity,trainsubject,trainfeatures)

testactivity <- read.table("UCI HAR Dataset/test/Y_test.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testfeatures <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(testactivity,testsubject,testfeatures)

trainandtest <- rbind(train, test)

names(trainandtest) <- c("ActivityCode", "SubjectCode", as.vector(featurenames$V2))

# Select columns with mean() and std() also Code 
trainandtest <- trainandtest[, grep("mean()|std()|Code", colnames(trainandtest))]

#exclude column with meanFreq as this does not seem to be mean() and std() values
trainandtest <- trainandtest[, -grep("meanFreq()", colnames(trainandtest))]

# Lookup Activity Label for each activity code and replace it in dataframe 
trainandtest$ActivityCode <- activitylabels$V2[match(trainandtest$ActivityCode,activitylabels$V1)]

# Create a new dataframe with the average of each variable for each activity and each subject.
summarydb <- aggregate(trainandtest[,3:ncol(trainandtest)], trainandtest[,1:2], FUN = mean)

# write back the newly created dataframe to file.
write.table(summarydb,file="summarydb.txt")

}
