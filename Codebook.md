#Code Book

The raw data anaylzed comes from work by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
Jorge L. Reyes-Ortiz, entitled *"A Public Domain Dataset for Human Activity Recognition Using 
Smartphones"*.

The background material and the data itself are available here:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .

2 sets of data were provided: test and training.  Data was provided in the following files:

1. primary data file - called  Xtrain.txt or Xtest.txt
2. activities file - called Ytrain.txt or Ytest.txt
3. subject identification file - called subject_train.txt or subject_test.txt

- Features are normalized and bounded within [-1,1].  Details about the post-processing of the 
raw data is available at the above website. 
	
In this analysis, I performed the following transformations: 
1. As instructed, I only looked at Standard Deviation and mean of the data items provided. 
2. The Standard Deviation and mean data was extracted from the primary data files.
3. The activity and subject were joined to them.
4. By subject and activity, the mean was calculated for each variable.  
	
	
Details of the data from the study authors:
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 
using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ 
and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

+ tBodyAcc-XYZ
+ tGravityAcc-XYZ
+ tBodyAccJerk-XYZ
+ tBodyGyro-XYZ
+ tBodyGyroJerk-XYZ
+ tBodyAccMag
+ tGravityAccMag
+ tBodyAccJerkMag
+ tBodyGyroMag
+ tBodyGyroJerkMag
+ fBodyAcc-XYZ
+ fBodyAccJerk-XYZ
+ fBodyGyro-XYZ
+ fBodyAccMag
+ fBodyAccJerkMag
+ fBodyGyroMag
+ fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

+ mean(): Mean value
+ std(): Standard deviation
+ mad(): Median absolute deviation 
+ max(): Largest value in array
+ min(): Smallest value in array
+ sma(): Signal magnitude area
+ energy(): Energy measure. Sum of the squares divided by the number of values. 
+ iqr(): Interquartile range 
+ entropy(): Signal entropy
+ arCoeff(): Autorregresion coefficients with Burg order equal to 4
+ correlation(): correlation coefficient between two signals
+ maxInds(): index of the frequency component with largest magnitude
+ meanFreq(): Weighted average of the frequency components to obtain a mean frequency
+ skewness(): skewness of the frequency domain signal 
+ kurtosis(): kurtosis of the frequency domain signal 
+ bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
+ angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

+ gravityMean
+ tBodyAccMean
+ tBodyAccJerkMean
+ tBodyGyroMean
+ tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

	
