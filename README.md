Course Project for getdata-007 Getting and Cleaning Data

The dataset for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For the script to run properly:

1 Place the "UCI HAR Dataset" directory in the working directory. 
2 Leave the contents of the "UCI HAR Dataset" directory unchanged
3 Make sure the plyr package is installed. The script calls the package into the library. 

The assignment calls for the script to complete the following:

1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement. 
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names. 
5 From the data set in step 4, creates a second, independent tidy data set 
		with the average of each variable for each activity and each subject.
		
Discussion of Part 1:

	The original dataset contains data for 30 subjects who were assigned to either a test 
	or training sample. The same set of measurements was taken on all subjects, but the
	dataset includes two sets of tables which must be merged. 
		
	Each set includes three relevant files: measurement data (X), an activity key (Y)
	and a subject indentification key (subject). Each set of 3 tables were read 
	using read.table. 
		
	The test tables (X, Y and subject) were merged with the train tables (X, Y and 
	subject) using rbind. 

Discussion of Part 2: 

 	Using the measurement names supplied in features.txt, column numbers for 
 	all measurments with names containing "mean" or "std" were selected using grep. 
 	Measurement names were also selected for later use as column names. 
 	
 	Only the columns for selected measurements with "mean" or "std" in the names were 
 	included in the X dataframe for measurement data. 
 	
 	The subsetted data frame was merged with the Y dataframe containing activity 
 	data, and the Subject dataframe containing the subject identification data. 
 	
Discussion of Part 3: 

	The Activity column was converted to a factor and then renamed using the 
	Activity names found in activity_labels.txt. 
	Levels are: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
		"SITTING", "STANDING" or "LAYING"

Discussion of Part 4: 

	Measurement names were preserved for the purposes of using descriptive column names
	for the data frame. This seemed best for the purposes of preserving specificity. 
	All measurement names were taken from the features.txt file. 
	Column names for "Activity" and "Subject" were applied directly. 

Discussion of Part 5:

	The dataframe is written to a text file using write.table and the argument 
	row.names=FALSE as instructed. 
	Note that the prefix "mean_" was appended to each measurement name to make it clear
	that the output is the mean of all obervations for that Subject and Activity. 


A number of threads in the discussion forums were particularly helpful with this project:

David Hood's project FAQ
https://class.coursera.org/getdata-007/forum/thread?thread_id=49

Kirsten Frank's thread on code book samples
https://class.coursera.org/getdata-007/forum/thread?thread_id=28

Richard's post on converting to factor and renaming
https://class.coursera.org/getdata-007/forum/thread?thread_id=233#comment-785

Malini's post on the output 
https://class.coursera.org/getdata-007/forum/thread?thread_id=233#post-921


