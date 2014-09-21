Codebook for Getting and Cleaning Data Course Project - project_df.txt

Subject - ID number for test subject, range 1:30
Activity - Description of recorded activity. In the original dataset, this is an
	integer ranged 1 to 6. This was transformed to a factor - Activity, renamed using the
	activity key "activity_labels.txt"
	Levels are: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
	"SITTING", "STANDING" or "LAYING"
		
The original dataset contains 3 directional components of a vector. From the original 
	dataset documentation in features_info.txt:
	"These signals were used to estimate variables of the feature vector for each pattern:  
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."
	
From the features_info.txt documentation:

	"These signals were used to estimate variables of the feature vector for each pattern:  
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

		tBodyAcc-XYZ
		tGravityAcc-XYZ
		tBodyAccJerk-XYZ
		tBodyGyro-XYZ
		tBodyGyroJerk-XYZ
		tBodyAccMag
		tGravityAccMag
		tBodyAccJerkMag
		tBodyGyroMag
		tBodyGyroJerkMag
		fBodyAcc-XYZ
		fBodyAccJerk-XYZ
		fBodyGyro-XYZ
		fBodyAccMag
		fBodyAccJerkMag
		fBodyGyroMag
		fBodyGyroJerkMag

	The set of variables that were estimated from these signals are: 

		mean(): Mean value
		std(): Standard deviation
		mad(): Median absolute deviation 
		max(): Largest value in array
		min(): Smallest value in array
		sma(): Signal magnitude area
		energy(): Energy measure. Sum of the squares divided by the number of values. 
		iqr(): Interquartile range 
		entropy(): Signal entropy
		arCoeff(): Autorregresion coefficients with Burg order equal to 4
		correlation(): correlation coefficient between two signals
		maxInds(): index of the frequency component with largest magnitude
		meanFreq(): Weighted average of the frequency components to obtain a mean 
					frequency
		skewness(): skewness of the frequency domain signal 
		kurtosis(): kurtosis of the frequency domain signal 
		bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT 
					of each window.
		angle(): Angle between to vectors.
	
	Additional vectors obtained by averaging the signals in a signal window sample. 
		These are used on the angle() variable:

		gravityMean
		tBodyAccMean
		tBodyAccJerkMean
		tBodyGyroMean
		tBodyGyroJerkMean

The assignment calls for "the measurements on the mean and standard 
 	deviation for each measurement." The original dataset contains 561 variables. 

The key provided with the dataset, "features.txt" contained measurement names. The 
	following were selected on the basis of "mean" being in the measurement name:			

 tBodyAcc-mean()-X
 tBodyAcc-mean()-Y
 tBodyAcc-mean()-Z
 tGravityAcc-mean()-X
 tGravityAcc-mean()-Y
 tGravityAcc-mean()-Z
 tBodyAccJerk-mean()-X
 tBodyAccJerk-mean()-Y
 tBodyAccJerk-mean()-Z
 tBodyGyro-mean()-X
 tBodyGyro-mean()-Y
 tBodyGyro-mean()-Z
 tBodyGyroJerk-mean()-X
 tBodyGyroJerk-mean()-Y
 tBodyGyroJerk-mean()-Z
 tBodyAccMag-mean()
 tGravityAccMag-mean()
 tBodyAccJerkMag-mean()
 tBodyGyroMag-mean()
 tBodyGyroJerkMag-mean()
 fBodyAcc-mean()-X
 fBodyAcc-mean()-Y
 fBodyAcc-mean()-Z
 fBodyAcc-meanFreq()-X
 fBodyAcc-meanFreq()-Y
 fBodyAcc-meanFreq()-Z
 fBodyAccJerk-mean()-X
 fBodyAccJerk-mean()-Y
 fBodyAccJerk-mean()-Z
 fBodyAccJerk-meanFreq()-X
 fBodyAccJerk-meanFreq()-Y
 fBodyAccJerk-meanFreq()-Z
 fBodyGyro-mean()-X
 fBodyGyro-mean()-Y
 fBodyGyro-mean()-Z
 fBodyGyro-meanFreq()-X
 fBodyGyro-meanFreq()-Y
 fBodyGyro-meanFreq()-Z
 fBodyAccMag-mean()
 fBodyAccMag-meanFreq()
 fBodyBodyAccJerkMag-mean()
 fBodyBodyAccJerkMag-meanFreq()
 fBodyBodyGyroMag-mean()
 fBodyBodyGyroMag-meanFreq()
 fBodyBodyGyroJerkMag-mean()
 fBodyBodyGyroJerkMag-meanFreq()

The following were selected on the basis of "std" being in the measurement name. 

 tBodyAcc-std()-X
 tBodyAcc-std()-Y
 tBodyAcc-std()-Z
 tGravityAcc-std()-X
 tGravityAcc-std()-Y
 tGravityAcc-std()-Z
 tBodyAccJerk-std()-X
 tBodyAccJerk-std()-Y
 tBodyAccJerk-std()-Z
 tBodyGyro-std()-X
 tBodyGyro-std()-Y
 tBodyGyro-std()-Z
 tBodyGyroJerk-std()-X
 tBodyGyroJerk-std()-Y
 tBodyGyroJerk-std()-Z
 tBodyAccMag-std()
 tGravityAccMag-std()
 tBodyAccJerkMag-std()
 tBodyGyroMag-std()
 tBodyGyroJerkMag-std()
 fBodyAcc-std()-X
 fBodyAcc-std()-Y
 fBodyAcc-std()-Z
 fBodyAccJerk-std()-X
 fBodyAccJerk-std()-Y
 fBodyAccJerk-std()-Z
 fBodyGyro-std()-X
 fBodyGyro-std()-Y
 fBodyGyro-std()-Z
 fBodyAccMag-std()
 fBodyBodyAccJerkMag-std()
 fBodyBodyGyroMag-std()
 fBodyBodyGyroJerkMag-std()
 
Each measurement was placed in a column containing every observation for that measurement.

Using ddply and numcolwise, the dataframe was summarized with id variables "Subject" 
		and "Activity". The resulting dataframe contains the mean for each measurement 
		for the specified activity and subject. 
		
The character string "mean_" was added to each measurement name to make clear that the 
	data is the mean for all observations for that measurement for the specified
	subject and activity. 

The following are column names for columns 3:81 which contain the measurement means.
		
mean_ tBodyAcc-mean()-X
mean_ tBodyAcc-mean()-Y
mean_ tBodyAcc-mean()-Z
mean_ tGravityAcc-mean()-X
mean_ tGravityAcc-mean()-Y
mean_ tGravityAcc-mean()-Z
mean_ tBodyAccJerk-mean()-X
mean_ tBodyAccJerk-mean()-Y
mean_ tBodyAccJerk-mean()-Z
mean_ tBodyGyro-mean()-X
mean_ tBodyGyro-mean()-Y
mean_ tBodyGyro-mean()-Z
mean_ tBodyGyroJerk-mean()-X
mean_ tBodyGyroJerk-mean()-Y
mean_ tBodyGyroJerk-mean()-Z
mean_ tBodyAccMag-mean()
mean_ tGravityAccMag-mean()
mean_ tBodyAccJerkMag-mean()
mean_ tBodyGyroMag-mean()
mean_ tBodyGyroJerkMag-mean()
mean_ fBodyAcc-mean()-X
mean_ fBodyAcc-mean()-Y
mean_ fBodyAcc-mean()-Z
mean_ fBodyAcc-meanFreq()-X
mean_ fBodyAcc-meanFreq()-Y
mean_ fBodyAcc-meanFreq()-Z
mean_ fBodyAccJerk-mean()-X
mean_ fBodyAccJerk-mean()-Y
mean_ fBodyAccJerk-mean()-Z
mean_ fBodyAccJerk-meanFreq()-X
mean_ fBodyAccJerk-meanFreq()-Y
mean_ fBodyAccJerk-meanFreq()-Z
mean_ fBodyGyro-mean()-X
mean_ fBodyGyro-mean()-Y
mean_ fBodyGyro-mean()-Z
mean_ fBodyGyro-meanFreq()-X
mean_ fBodyGyro-meanFreq()-Y
mean_ fBodyGyro-meanFreq()-Z
mean_ fBodyAccMag-mean()
mean_ fBodyAccMag-meanFreq()
mean_ fBodyBodyAccJerkMag-mean()
mean_ fBodyBodyAccJerkMag-meanFreq()
mean_ fBodyBodyGyroMag-mean()
mean_ fBodyBodyGyroMag-meanFreq()
mean_ fBodyBodyGyroJerkMag-mean()
mean_ fBodyBodyGyroJerkMag-meanFreq()
mean_ tBodyAcc-std()-X
mean_ tBodyAcc-std()-Y
mean_ tBodyAcc-std()-Z
mean_ tGravityAcc-std()-X
mean_ tGravityAcc-std()-Y
mean_ tGravityAcc-std()-Z
mean_ tBodyAccJerk-std()-X
mean_ tBodyAccJerk-std()-Y
mean_ tBodyAccJerk-std()-Z
mean_ tBodyGyro-std()-X
mean_ tBodyGyro-std()-Y
mean_ tBodyGyro-std()-Z
mean_ tBodyGyroJerk-std()-X
mean_ tBodyGyroJerk-std()-Y
mean_ tBodyGyroJerk-std()-Z
mean_ tBodyAccMag-std()
mean_ tGravityAccMag-std()
mean_ tBodyAccJerkMag-std()
mean_ tBodyGyroMag-std()
mean_ tBodyGyroJerkMag-std()
mean_ fBodyAcc-std()-X
mean_ fBodyAcc-std()-Y
mean_ fBodyAcc-std()-Z
mean_ fBodyAccJerk-std()-X
mean_ fBodyAccJerk-std()-Y
mean_ fBodyAccJerk-std()-Z
mean_ fBodyGyro-std()-X
mean_ fBodyGyro-std()-Y
mean_ fBodyGyro-std()-Z
mean_ fBodyAccMag-std()
mean_ fBodyBodyAccJerkMag-std()
mean_ fBodyBodyGyroMag-std()
mean_ fBodyBodyGyroJerkMag-std()

 
 
 