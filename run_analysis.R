## Getting and Cleaning Data Course Project
library(plyr)
## Read text files into dataframes
## Test Data frames
test_x_df <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
test_y_df <- read.table("./UCI HAR Dataset/test/Y_test.txt", header = FALSE, sep = "")
test_subject_df <- read.table("./UCI HAR Dataset/test/subject_test.txt",
              header = FALSE, sep = "")

## Train Data frames
train_x_df <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
train_y_df <- read.table("./UCI HAR Dataset/train/Y_train.txt", header = FALSE, sep = "")
train_subject_df <- read.table("./UCI HAR Dataset/train/subject_train.txt",
              header = FALSE, sep = "")

## Part 1 - Merges the training and the test sets to create one data set
x_all_df <- rbind(test_x_df, train_x_df)
y_all_df <- rbind(test_y_df, train_y_df)
subject_all_df <- rbind(test_subject_df, train_subject_df)

## Part 2 - Extracts only the measurements on the mean 
##          and standard deviation for each measurement. 

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep = "")

mean_colnums <- grep("mean", features$V2)
std_colnums <- grep("std", features$V2)
var_colnums <- c(mean_colnums, std_colnums)

x_df <- x_all_df[var_colnums]
all_df<- cbind(x_df, y_all_df, subject_all_df)

## Part 4 - Appropriately labels the data set with descriptive variable names. 

std_colnames <- as.character(features[grep("std", features$V2), 2])
mean_colnames <- as.character(features[grep("mean", features$V2), 2])
var_names <- c(mean_colnames, std_colnames)

colnames(all_df)[1:79] <- var_names
colnames(all_df)[80:81] <- c("Activity", "Subject")

# ## Part 3 -  Uses descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt",
              header = FALSE, sep = "")
labels <- activities[, 2]
all_df$Activity <- factor(all_df$Activity, labels = labels)

# ## Part 5 - From the data set in step 4, creates a second, independent
# ##          tidy data set with the average of each variable 
# ##          for each activity and each subject.

project_df <- ddply(all_df, .(Subject, Activity), numcolwise(mean))
colnames(project_df)[3:81] <- paste("mean_", var_names)
write.table(project_df, "project_df.txt", row.names=FALSE)

