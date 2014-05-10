
# check whether "UCI HAR Dataset" exist is working, if not, down it from internet
if (!file.exists("UCI HAR Dataset")) {
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl, "temp.zip", method="curl")
  unzip("temp.zip")
  unlink("temp.zip", recursive = FALSE)
}

# read data 
features <- read.table("UCI HAR Dataset/features.txt")
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
testdata <- read.table("UCI HAR Dataset/test/X_test.txt")

# Merges the training and the test sets to create one data set
data<-rbind(traindata,testdata)

# renames features in data frame "data"
names(data) <- features[,2]

# Extracts index of features only the measurements on the mean and standard deviation for each measurement
fea_index <- grep("(mean|std)\\(",features[,2])
data <- data[,fea_index]

# Uses descriptive activity names to name the activities in the data set
# read descriptive activity in activity_labels.txt
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# read labels files, merge them, rename labels by descriptive activity names
trainlabel <- read.table("UCI HAR Dataset/train/y_train.txt")
testlabel <- read.table("UCI HAR Dataset/test/y_test.txt")
label <- rbind(trainlabel,testlabel)
names(label) <- "activity"
label[[1]] <- activity_labels[label[[1]],2]

# read subject 
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(trainsubject,testsubject)
names(subject) <- "subject"

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
agg <- aggregate(data, by = list(activity = label[,1], subject = subject[,1]), mean)
write.csv(agg , file='output.txt',row.names=F)

