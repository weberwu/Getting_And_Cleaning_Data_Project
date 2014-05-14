# Getting and Clearning Data Project

## Introduction

This repository contains one script "run_analysis.R".

The goal of this script is to prepare tidy data from data collected from the accelerometers from the Samsung Galaxy'S smartphone.


## run_analysis.R script

#### The R script do the following jobs:

#### 1. Prepare input data. 

   Please first put "UCI HAR Dataset" directory in your working directory. 
   
   Otherwise the script will download it from internet automatically.    

#### 2. Merges the training and the test sets to create one data set.
   
   It reads data from "UCI HAR Dataset/train/X_train.txt" and "UCI HAR Dataset/test/X_test.txt" and merget it as unique dataframe.

#### 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
   
   Read data features' descriptions from "UCI HAR Dataset/features.txt" and retain measurements on the mean and standard deviation only.

#### 4. Uses descriptive activity names to name the activities in the data set

   Rename column index by the description from step 3.

#### 5. Appropriately labels the data set with descriptive activity names. 

   Read activity label from "UCI HAR Dataset/activity_labels.txt", replace all activity label from numeric number to descriptive string.

#### 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
   
   Aggregate data mean by activity and subject, write out the aggregated result to 'output.txt'
    

## execute the script

The script can be executed simply vy command "Rscript run_analysis.R"

The tidy data generated from the input is named as "output.txt" in your working directory.
