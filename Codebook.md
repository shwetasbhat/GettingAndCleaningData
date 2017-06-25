The features selected for this database come from the embeded accelerometer and gyroscope smartphone (Samsung Galaxy S II). 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." The following regular expression has been used to select features 
from the original dataset : "mean\\(\\)", "std\\(\\)"

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated (and kept for this assignment) from these signals are:
mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Other estimates have been removed for the purpose of this excercise.

Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: timeBodyAcceleration-mean()-X, which has the mean value of 

tBodyAcc-X.
In addition to the above variables, in the final data set, subject and activity are added to identify the subject and the 

corresponding activity performed.
In the resulting tidy data, the mean of all the variables has been taken for a particular subject and activity performed.
