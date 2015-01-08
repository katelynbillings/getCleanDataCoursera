# This Program seeks to do the following to the Samsung Galaxy S activity data:

#1. Merge the training and the test sets to create one data set.
#2. Extract only the measurements on the mean and standard deviation for each
#   measurement. 
#3. From the data set in step 2, create a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.

#Load Dependencies
library(dplyr)
library(reshape2)

run_analysis <- function(){    
    
    # Download Data if it is not already in the working directory 
    # Change the data directory to the working directory 
    if(!file.exists("./UCI Har Dataset")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./downloadedData", method = "curl")
        dateDownloaded <- date()
        print(c("File downloaded on", dateDownloaded))
        unzip("./downloadedData")
    }
    setwd("./UCI Har Dataset")
    
    #Get Training Set, Add Column for Activity, Subject ID and Group Type. 
    trainingSet <- read.table("./train/X_train.txt")
    trainingSet <- cbind(subjectid = read.table("./train/subject_train.txt")[,1],
                         group = "train",
                         activity = read.table("./train/y_train.txt")[,1],
                         trainingSet)
    
    #Get Test Set. Add Column for Activity, Subject ID and Group Type
    testSet <- read.table("./test/X_test.txt")
    testSet <- cbind(subjectid = read.table("./test/subject_test.txt")[,1],
                     group = "test", 
                     activity = read.table("./test/y_test.txt")[,1],
                     testSet)
    
    #Merge Training and Test Set and Melt everything but Subject ID, Group and 
    #Activity to a feature variable. Arrange by Subject Id then Group, Activity 
    #and Feature
    samsungData <- rbind(testSet, trainingSet) %>%
                   melt(id = c("subjectid", "group", "activity")) %>%
                   rename(feature = variable) %>%
                   rename(measurement = value) %>%
                   arrange(subjectid, group, activity, feature)
    
    #Clean up activity labels. Convert to factor labels for samsungData
    activityLabels <- read.table("./activity_labels.txt")[,2] %>% 
                      tolower() %>%
                      gsub(pattern = "_", replacement = "")    
    samsungData$activity <- factor(samsungData$activity)
    levels(samsungData$activity) <- activityLabels

    #Clean up feature labels. Convert to factor labels for samsungData
    featureLabels <- read.table("./features.txt")[,2] %>%
                     gsub(pattern = "_|\\(|\\)|-|\\,", replacement = "")
    samsungData$feature <- factor(samsungData$feature)
    levels(samsungData$feature) <- featureLabels
    
    #Extract Mean and Std Deviation Measurements and Group By Subject ID, 
    #Activity and Feature. Return data set with the average measurement of each 
    #feature for each activity and subject.
    averageMeasurements <- filter(samsungData, grepl("mean", ignore.case = TRUE, feature) 
                                  | grepl("std", ignore.case = TRUE, feature)
                                  ) %>%
                           group_by(subjectid, activity, feature) %>%
                           summarize(mean(measurement))
    
    #Return to previous working directory
    setwd("../")
    
    #Return cleaned data
    write.table(averageMeasurements, "averageMeasurements.txt", row.names=FALSE)
    averageMeasurements
}