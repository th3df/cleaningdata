### Code Book

This code book describes the data and analysis performed on the "Human Activity Recognition Using Smartphones Dataset"
data set of experiments performed by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws  
www.smartlab.ws 


### Context

The experiments involved use of smart-phones/accelerometers by volunteer subjects in the recording of signals that were
later interpreted as activities.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Dataset inventory

The dataset includes the following files:

* **README.txt**

* **features_info.txt**: Shows information about the features/variables measured in the experiments.

* **features.txt**: A list of 561 feature labels representing the columns in the observation files y_train.txt and y_test.txt.

* **activity_labels.txt**: Six descriptive name  and their integer mappings that represent activity 
being performed in a given observation within the X_train.txt and X_test.txt files.

* **train/X_train.txt**: Set of 7352 (rows) observations with 561 columns of feature data.

* **train/y_train.txt**: A set of 7352 activity labels that map to each row of the observation data in X_train.txt.

* **train/subject_train.txt**: A set of 7352 subject labels that map to each row of the observation data in X_train.txt.

* **test/X_test.txt**: Set of 2947 (rows) observations with 561 columns of feature data.

* **test/y_test.txt**: A set of 2947 activity labels that map to each row of the observation data in X_test.txt.

* **test/subject_test.txt**: A set of 2947 subject labels that map to each row of the observation data in X_test.txt.

### Transformation of data

The data was manipulated and combined using the script **run_analysis.R** to produce a tidy data set for further analysis.
The README.md file in this repo provides a detailed description of the manipulation performed by the script. 
The following is a qualitative description of the various transformations to produce the final tidy data set.

* combine the **X_[test/train].txt** observations into a single table with 10299 observations (rows) and 561 feature measurements (columns)
* combine the  **y_[test/train].txt** files into a single vector and merge as a column in the observation file  
* combine the  **subject_[test/train].txt** subject labels into a single vector and merge as another column in the observation file
* map the descriptive names in **activity_labels.txt** for each row of the observation file
* create a separate observation table and select only the columns for features related to mean() or std() (66 columns)
* for each combination of subject/activity calculation the mean across all observations for each feature (column)
* write this tide data set of feature averages into a text file.

### The tidy data set

The output of the script is a table (written into a CSV text file) called tidyDataSet.txt. The table contains 180 rows
and 68 columns. Each row represents a summary (average) of feature measurements from the the original observation file
for each subject/activity combination. Each column represents the average value for that feature over all observations 
in the raw file for a given subject/activity combination. 
The subject labels in column 1 are integers that range from 1 to 30, representing the volunteers. The activity labels in column 2 are as follows: 
**WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.** 

The remaining 66 columns represent the average measurement for the given feature across all observations in the raw observation files for that given
combination of subject and activity.

## The variable dictionary for tidy data frame "set by_subj_activity" / text file "tidyDataSet.txt"

**The units of the two ID variables are:**

*subject is an integer*

*activity is a factor with six levels as indicated above*

**The units of the 66 variables/features in the tidy data set are as follows for the various categories:**

*acceleration (Acc) are meters/square second*

*jerk (AccJerk) are meters/cube second*

*gyroscope reading (Gyro) are radians/second*

*gyroscope jerk  (GyroJerk) are radians/square second*

*acceleration magnitude (AccMag) are meters/square sec*

*acceleration jerk magnitude (AccJerkMag) are meters/cube sec*

*gyroscope reading magnitude (GyroMag) are radians/second*

*gyroscope jerk magnitude (GyroJerkMag) are radians/square second*

*Fast Fourier Transform variables have the same units as their corresponding time domain variables as above.*


**The 68 variables labels are as below:**
subject,  
activity,  
tBodyAcc_mean___X,  
tBodyAcc_mean___Y,  
tBodyAcc_mean___Z,  
tGravityAcc_mean___X,  
tGravityAcc_mean___Y,  
tGravityAcc_mean___Z,  
tBodyAccJerk_mean___X,  
tBodyAccJerk_mean___Y,  
tBodyAccJerk_mean___Z,  
tBodyGyro_mean___X,  
tBodyGyro_mean___Y,  
tBodyGyro_mean___Z,  
tBodyGyroJerk_mean___X,  
tBodyGyroJerk_mean___Y,  
tBodyGyroJerk_mean___Z,  
tBodyAccMag_mean__,  
tGravityAccMag_mean__,  
tBodyAccJerkMag_mean__,  
tBodyGyroMag_mean__,  
tBodyGyroJerkMag_mean__,  
fBodyAcc_mean___X,  
fBodyAcc_mean___Y,  
fBodyAcc_mean___Z,  
fBodyAccJerk_mean___X,  
fBodyAccJerk_mean___Y,  
fBodyAccJerk_mean___Z,  
fBodyGyro_mean___X,  
fBodyGyro_mean___Y,  
fBodyGyro_mean___Z,  
fBodyAccMag_mean__,  
fBodyBodyAccJerkMag_mean__,  
fBodyBodyGyroMag_mean__,  
fBodyBodyGyroJerkMag_mean__,  
tBodyAcc_std___X,  
tBodyAcc_std___Y,  
tBodyAcc_std___Z,  
tGravityAcc_std___X,  
tGravityAcc_std___Y,  
tGravityAcc_std___Z,  
tBodyAccJerk_std___X,  
tBodyAccJerk_std___Y,  
tBodyAccJerk_std___Z,  
tBodyGyro_std___X,  
tBodyGyro_std___Y,  
tBodyGyro_std___Z,  
tBodyGyroJerk_std___X,  
tBodyGyroJerk_std___Y,  
tBodyGyroJerk_std___Z,  
tBodyAccMag_std__,  
tGravityAccMag_std__,  
tBodyAccJerkMag_std__,  
tBodyGyroMag_std__,  
tBodyGyroJerkMag_std__,  
fBodyAcc_std___X,  
fBodyAcc_std___Y,  
fBodyAcc_std___Z,  
fBodyAccJerk_std___X,  
fBodyAccJerk_std___Y,  
fBodyAccJerk_std___Z,  
fBodyGyro_std___X,  
fBodyGyro_std___Y,  
fBodyGyro_std___Z,  
fBodyAccMag_std__,  
fBodyBodyAccJerkMag_std__,  
fBodyBodyGyroMag_std__,  
fBodyBodyGyroJerkMag_std__    

