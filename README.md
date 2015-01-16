# Course Project

Code: run_analysis.R

Author: Katelyn Billings

Publisher: Coursera

Education Institution: Johns Hopkins

Specialisation: Data Science

Course: Getting and Cleaning Data

Assignment: Course Project

Date: 2015/Jan

##Description

This assignment uses data from the UC Irvine Machine Learning Repository. In 
particular, we will be using the “Human Activity Recognition Using Smartphones 
Data Set”. The dataset has measurements of linear acceleration and angular
velocity at a constant rate of 50 Hz while the subject performed six activities:
walking, walkingupstairs, walkingdownstairs, sitting, standing and laying. The 
data was randomly partioned into two sets, where 70% of the volunteers were
selected for generating the training data and 30% the test data.

##Assignment

The goal is to prepare tidy data that can be used for later analysis by:

1. Merging the training and the test sets to create one data set.

2. Extracting only the measurements on the mean and standard deviation for 
each measurement. 

3. Using descriptive activity names to name the activities in the data set

4. Appropriately labeling the data set with descriptive variable names. 

5. From the data set in step 4, creating a second, independent tidy data set 
with the average of each variable for each activity and each subject.

##Running the code

###pre-requisites

The R code can be run with R studio. Enough computer memory is required to match 
the volume of data. The "run_analysis.R" script must be in the working 
directory. The dataset does not need to be pre-downloaded.

###Running with RStudio

1) Check that the "run_analysis.R" script is in the working directory.

2) Source the R code from the console:


```r
source("./run_analysis.R")
```

3) Call the resulting function RunAnalysis from the console. There are no
arguments that need to be passed to the function. The function will write a 
tidy data set to the working directory as "averageMeasurements.txt" but will
also return the dataset to the console where it can be saved if so desired. 


```r
RunAnalysis()
```

```
## Source: local data frame [15,480 x 4]
## Groups: subjectid, activity
## 
##    subjectid activity          feature meanmeasurement
## 1          1  walking    tBodyAccmeanX      0.27733076
## 2          1  walking    tBodyAccmeanY     -0.01738382
## 3          1  walking    tBodyAccmeanZ     -0.11114810
## 4          1  walking     tBodyAccstdX     -0.28374026
## 5          1  walking     tBodyAccstdY      0.11446134
## 6          1  walking     tBodyAccstdZ     -0.26002790
## 7          1  walking tGravityAccmeanX      0.93522320
## 8          1  walking tGravityAccmeanY     -0.28216502
## 9          1  walking tGravityAccmeanZ     -0.06810286
## 10         1  walking  tGravityAccstdX     -0.97660964
## ..       ...      ...              ...             ...
```

```r
# tidyData <- RunAnalysis() could be used if it is desirable to save the tidy 
# data to the global environment
```
