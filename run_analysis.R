
### Getting and Cleaning Data
### Course Project

# The purpose of this project is to collect, work with, and clean
# a data set. The goal is to prepare tidy data that can be used 
# for later analysis

# The data represent data collected from the accelerometers 
# from the Samsung Galaxy S. This is the source of the data:

# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
# Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
# Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
# Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#============================================================================


## Step 1: Upload and merge the train and test data sets

## Upload data
X_test <- read.table("X_test.txt", quote="\"")
X_train <- read.table("X_train.txt", quote="\"")
subject_test <- read.table("subject_test.txt", quote="\"")
subject_train <- read.table("subject_train.txt", quote="\"")
y_train <- read.table("y_train.txt", quote="\"")
y_test <- read.table("y_test.txt", quote="\"")
features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")

## Combination of train and test sets
x <- rbind(X_test, X_train)

#==================================================================================

## Step 2: Extracts only the measurements on the mean and standard 
#deviation for each measurement. 

# Before select the mean and standar deviation, we need to include the column names in the data
names(x) <- (features[,2])

# Now we make a subset that only contains columns that contains "mean" and "std"
x_meanstd <- subset(x, , select = c(grep(("mean()"),names(x)), grep(("std()"),names(x))))

#==================================================================================

## Step 3.Uses descriptive activity names to name the activities in the data set

# First we combine the activities id for the test and train sets
y <- rbind(y_test, y_train)
names(y) = "activity"

#Now we include the activities id in the data set "x_meanstd"
x_meanstd <- cbind(y,x_meanstd)

# Finally we change the activity id number for the corresponding name
x_meanstd$activity <- factor(x_meanstd$activity, labels = activity_labels[,2])

#==================================================================================

## Step 4: Appropriately labels the data set with descriptive variable names. 

## We already include the activity labels in the step 2

#==================================================================================

## 5.From the data set in step 4, creates a second, independent tidy data set 
#  with the average of each variable for each activity and each subject.

# Firs we include the subject ID in the data set
subject <- rbind(subject_test, subject_train)
names(subject) = "subject"

# Now we include the subject id in the data set "x_meanstd"
x_meanstd <- cbind(subject,x_meanstd)

# We convert the subject and activity columns in factors
x_meanstd$activity <- as.factor(x_meanstd$activity)
x_meanstd$subject <- as.factor(x_meanstd$subject)

# We melt the data before as previous step to obtain the final data set
X_pre <- melt(x_meanstd, id = c("subject","activity"))

# We use the function dcast to create the a tidy data set in which
# each column is the mean for each subject and activity
X_final <- dcast(X_pre, subject + activity  ~ variable, value.var = 'value', fun.aggregate = mean, na.rm = TRUE) 

## Finally we export the data set
write.table(X_final, file = "tidy_data.txt", append = FALSE, quote = TRUE, sep = " ",
        eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = TRUE)




