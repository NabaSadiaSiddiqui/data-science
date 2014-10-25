###Describes the variables, the data, and any transformations performed to clean up the data
  
####Download
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
####Source
UCI Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
####Data set information
The tidy data produced from running run_analysis::main has the average of the mean and standard deviation for each each measurement for each activity and each subject. That is, for each person, it finds the average of the various mean and standard deviation measurements obtained when the person performed a certain number of instances of each activity.  
The first column of the tidy data is *Subject ID*, the second column is the activity performed by the subject, and the rest of the columns are the average of the mean and standard deviation of the various measurements (units in Hz)  

####Data set tranformation
1. Download and load the data
2. Merge the various components of train and test data sets to form 2 data sets, each representing train/test
3. Merge train and test data sets to form 1 data set
4. Subset the merged data to extract only mean and standard deviation measurements
5. Average the mean and standard deviation measurements per person per activity
6. Update the "Activity" column in the resulting data set to represent the activity in terms of its label than its number identifier (WALKING instead of 1)
7. Clean the directory by removing downloaded and extracted files/directories
8. Return the final, tidy data set in the flat file result.txt
  
####Attribute information
The measurements that the mean and standard deviation pertain to are  
- Triaxial acceleration from the accelerometer (total acceleration)
- Triaxial acceleration from the accelerometer (body acceleration)
- Triaxial Angular velocity from the gyroscope. 
  
####Variables
- Subject-ID  
          Person ID
- Activity  
          Activity perfromed by the person
- tBodyAcc-mean()-X  
          Average of the time-domain mean body acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAcc-mean()-Y  
          Average of the time-domain mean body acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAcc-mean()-Z  
          Average of the time-domain mean body acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAcc-std()-X  
          Average of the time-domain standard deviation in body acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAcc-std()-Y  
          Average of the time-domain standard deviation in body acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAcc-std()-Z  
          Average of the time-domain standard deviation in body acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tGravityAcc-mean()-X  
          Average of the time-domain mean gravity acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tGravityAcc-mean()-Y  
          Average of the time-domain mean gravity acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tGravityAcc-mean()-Z  
          Average of the time-domain mean gravity acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tGravityAcc-std()-X  
          Average of the time-domain standard deviation in gravity acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tGravityAcc-std()-Y  
          Average of the time-domain standard deviation in gravity acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tGravityAcc-std()-Z  
          Average of the time-domain standard deviation in gravity acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerk-mean()-X  
          Average of the time-domain mean body jerk acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerk-mean()-Y  
          Average of the time-domain mean body jerk acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerk-mean()-Z  
          Average of the time-domain mean body jerk acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerk-std()-X  
          Average of the time-domain standard deviation in body jerk acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerk-std()-Y  
          Average of the time-domain standard deviation in body jerk acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerk-std()-Z  
          Average of the time-domain standard deviation in body jerk acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyro-mean()-X  
          Average of the time-domain mean body velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyro-mean()-Y  
          Average of the time-domain mean body velody measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyro-mean()-Z  
          Average of the time-domain mean body velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyro-std()-X  
          Average of the time-domain standard deviation in body velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyro-std()-Y  
          Average of the time-domain standard deviation in body velocity measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyro-std()-Z  
          Average of the time-domain standard deviation in body velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerk-mean()-X  
          Average of the time-domain mean body jerk velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerk-mean()-Y  
          Average of the time-domain mean body jerk velocity measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerk-mean()-Z  
          Average of the time-domain mean body jerk velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerk-std()-X  
          Average of the time-domain standard deviation in body jerk velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerk-std()-Y  
          Average of the time-domain standard deviation in body jerk velocity measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerk-std()-Z  
          Average of the time-domain standard deviation in body jerk velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccMag-mean()  
          Average of the time-domain mean of magnitude of body acceleration, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccMag-std()  
          Average of the time-domain standard deviation in magnitude of body acceleration, performed by *Subject-ID* for all instances of *Activity*
- tGravityAccMag-mean()   
          Average of the time-domain mean of magnitude of gravity acceleration, performed by *Subject-ID* for all instances of *Activity*
- tGravityAccMag-std()  
          Average of the time-domain standard deviation of magnitude of gravity acceleration, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerkMag-mean()  
          Average of the time-domain mean of magnitude of body jerk acceleration, performed by *Subject-ID* for all instances of *Activity*
- tBodyAccJerkMag-std()  
          Average of the time-domain standard deviation of magnitude of body jerk acceleration, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroMag-mean()  
          Average of the time-domain mean of magnitude of velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroMag-std()  
          Average of the time-domain standard deviation in magnitude of velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerkMag-mean()  
          Average of the time-domain mean of magnitude of body jerk velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- tBodyGyroJerkMag-std()  
          Average of the time-domain standard deviation in magnitude of body jerk velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- fBodyAcc-mean()-X  
          Average of the frequency-domain mean body acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAcc-mean()-Y  
          Average of the frequency-domain mean body acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAcc-mean()-Z  
          Average of the frequency-domain mean body acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAcc-std()-X  
          Average of the frequency-domain standard deviation in body acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAcc-std()-Y  
          Average of the frequency-domain standard deviation in body acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAcc-std()-Z  
          Average of the frequency-domain standard deviation in body acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fGravityAcc-mean()-X  
          Average of the frequency-domain mean gravity acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fGravityAcc-mean()-Y  
          Average of the frequency-domain mean gravity acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fGravityAcc-mean()-Z  
          Average of the frequency-domain mean gravity acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fGravityAcc-std()-X  
          Average of the frequency-domain standard deviation in gravity acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fGravityAcc-std()-Y  
          Average of the frequency-domain standard deviation in gravity acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fGravityAcc-std()-Z  
          Average of the frequency-domain standard deviation in gravity acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerk-mean()-X  
          Average of the frequency-domain mean body jerk acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerk-mean()-Y  
          Average of the frequency-domain mean body jerk acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerk-mean()-Z  
          Average of the frequency-domain mean body jerk acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerk-std()-X  
          Average of the frequency-domain standard deviation in body jerk acceleration in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerk-std()-Y  
          Average of the frequency-domain standard deviation in body jerk acceleration in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerk-std()-Z  
          Average of the frequency-domain standard deviation in body jerk acceleration in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyro-mean()-X  
          Average of the frequency-domain mean body velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyro-mean()-Y  
          Average of the frequency-domain mean body velody measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyro-mean()-Z  
          Average of the frequency-domain mean body velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyro-std()-X  
          Average of the frequency-domain standard deviation in body velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyro-std()-Y  
          Average of the frequency-domain standard deviation in body velocity measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyro-std()-Z  
          Average of the frequency-domain standard deviation in body velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerk-mean()-X  
          Average of the frequency-domain mean body jerk velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerk-mean()-Y  
          Average of the frequency-domain mean body jerk velocity measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerk-mean()-Z  
          Average of the frequency-domain mean body jerk velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerk-std()-X  
          Average of the frequency-domain standard deviation in body jerk velocity measured from the gyroscope in X-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerk-std()-Y  
          Average of the frequency-domain standard deviation in body jerk velocity measured from the gyroscope in Y-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerk-std()-Z  
          Average of the frequency-domain standard deviation in body jerk velocity measured from the gyroscope in Z-direction, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccMag-mean()  
          Average of the frequency-domain mean of magnitude of body acceleration, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccMag-std()  
          Average of the frequency-domain standard deviation in magnitude of body acceleration, performed by *Subject-ID* for all instances of *Activity*
- fGravityAccMag-mean()   
          Average of the frequency-domain mean of magnitude of gravity acceleration, performed by *Subject-ID* for all instances of *Activity*
- fGravityAccMag-std()  
          Average of the frequency-domain standard deviation of magnitude of gravity acceleration, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerkMag-mean()  
          Average of the frequency-domain mean of magnitude of body jerk acceleration, performed by *Subject-ID* for all instances of *Activity*
- fBodyAccJerkMag-std()  
          Average of the frequency-domain standard deviation of magnitude of body jerk acceleration, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroMag-mean()  
          Average of the frequency-domain mean of magnitude of velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroMag-std()  
          Average of the frequency-domain standard deviation in magnitude of velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerkMag-mean()  
          Average of the frequency-domain mean of magnitude of body jerk velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
- fBodyGyroJerkMag-std()  
          Average of the frequency-domain standard deviation in magnitude of body jerk velocity measured from gyroscope, performed by *Subject-ID* for all instances of *Activity*
