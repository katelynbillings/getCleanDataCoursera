Code Book for Getting and Cleaning Data Course Project
======================================================

##Variables

A description of the variables that appear in the tidy data set:

###subject

An integer from 1-30 that identifies the subject. The subject variable gets its 
value from the "subject_test.txt" file or the 
"subject_train.text" file depending on whether the subject was in the training or
test data set. 

###group

A factor variable that identifies whether the subject belonged to the test or 
train data set. Level labels are "test" and "train".

###activity

A factor that gets its value from the "y_test.txt" file or the 
"y_train.txt" file and its label from the 
"activity_labels.txt" file. The labels were cleaned to be all lowercase and void 
of any non-alphanumeric characters. The possible levels are
walking, walkingupstairs, walkingdownstairs, sitting, standing and laying. 

###feature

A factor variable indicating one of the 561 features listed in "features.txt" 
file. The factor labels were stripped of all non-alphanumeric characters that
had appeared in the "features.txt" file. For more information see "README.txt"
and "features_info.txt" contained in the downloaded data files.

###meanmeasurement

The mean measurement of each feature for each activity and subject. The 
unit presumably varies depending on the type of measurement but was not 
specified in the original dataset so is unknown.

##Summary Choices

1. Only the data that corresponded to a mean ("mean") or standard deviation 
("std") measurement -- as indicated by the feature factor -- were kept.

2. From this subset of the data, the mean measurement for each feature for each 
activity and subject was calculated and stored in the variable 
"meanmeasurement".

3. The tidy data set is comprised of 5 variables as indicated above.

##Study Design: 

*This information is copied from the UCI HAR Dataset README.txt:*

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    -tBodyAcc-XYZ
    -tGravityAcc-XYZ
    -tBodyAccJerk-XYZ
    -tBodyGyro-XYZ
    -tBodyGyroJerk-XYZ
    -tBodyAccMag
    -tGravityAccMag
    -tBodyAccJerkMag
    -tBodyGyroMag
    -tBodyGyroJerkMag
    -fBodyAcc-XYZ
    -fBodyAccJerk-XYZ
    -fBodyGyro-XYZ
    -fBodyAccMag
    -fBodyAccJerkMag
    -fBodyGyroMag
    -fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

    -mean(): Mean value
    -std(): Standard deviation
    -mad(): Median absolute deviation 
    -max(): Largest value in array
    -min(): Smallest value in array
    -sma(): Signal magnitude area
    -energy(): Energy measure. Sum of the squares divided by the number of values. 
    -iqr(): Interquartile range 
    -entropy(): Signal entropy
    -arCoeff(): Autorregresion coefficients with Burg order equal to 4
    -correlation(): correlation coefficient between two signals
    -maxInds(): index of the frequency component with largest magnitude
    -meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    -skewness(): skewness of the frequency domain signal 
    -kurtosis(): kurtosis of the frequency domain signal 
    -bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    -angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

    -gravityMean
    -tBodyAccMean
    -tBodyAccJerkMean
    -tBodyGyroMean
    -tBodyGyroJerkMean


The complete list of variables of each feature vector is available in 'features.txt'

