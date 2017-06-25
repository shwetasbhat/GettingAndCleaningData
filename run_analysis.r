library(plyr)
library(dplyr)
library(data.table)

# Download the data into a temp file

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp, list = TRUE)

# Reading the relevant data into tables

# Reading the training data set

df1 <- read.table(unzip(temp,"UCI HAR Dataset/train/X_train.txt"))
df2 <- read.table(unzip(temp,"UCI HAR Dataset/train/y_train.txt"))
sub_df <- read.table(unzip(temp,"UCI HAR Dataset/train/subject_train.txt"))

# Reading the test data set

df3 <- read.table(unzip(temp,"UCI HAR Dataset/test/X_test.txt"))
df4 <- read.table(unzip(temp,"UCI HAR Dataset/test/y_test.txt"))
sub_df2 <- read.table(unzip(temp,"UCI HAR Dataset/test/subject_test.txt"))

#Reading the features

features <- read.table(unzip(temp,"UCI HAR Dataset/features.txt"))

#Reading the activity

activitydf <- read.table(unzip(temp,"UCI HAR Dataset/activity_labels.txt"))

unlink(temp)

# 1. Merges the training and the test sets to create one data set.

merge_x <- rbind(df1,df3)
merge_y <- rbind(df2,df4)
merge_sub <- rbind(sub_df,sub_df2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Putting in the variable names from the features table

colnames(merge_x) <- features$V2

# Checking for mean and standard deviation in the features

z <- c("mean\\(\\)", "std\\(\\)")
grep(paste(z,collapse = '|'),colnames(merge_x))
newdf <- merge_x[,grep(paste(z,collapse = '|'),colnames(merge_x))]

finaldf <- cbind(newdf,merge_sub,merge_y )
colnames(finaldf)[67:68] <- c("subject","activity")


# 3. Uses descriptive activity names to name the activities in the data set

finaldf$activity <- activitydf[,2][match(finaldf$activity, activitydf[,1])]

# 4. Appropriately labels the data set with descriptive variable names.

names(finaldf) <- gsub("^t", "time",names(finaldf))
names(finaldf) <- gsub("^f", "frequency", names(finaldf))
names(finaldf) <- gsub("Acc", "Acceleration", names(finaldf))
names(finaldf) <- gsub("BodyBody", "Body", names(finaldf))
names(finaldf) <- gsub("Gyro", "AngularVelocity", names(finaldf))
names(finaldf) <- gsub("Mag", "Magnitude", names(finaldf))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata <- aggregate(. ~subject + activity, finaldf, mean)
tidydata <- tidydata[order(tidydata$subject,tidydata$activity),]

write.table(tidydata, file="tidydatafile.txt",row.name=FALSE)