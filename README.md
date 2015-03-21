###Processing the "Human Activity Recognition Using Smartphones Dataset"

This guide provides context and description of the processing done by the R-script **run_analysis.R** in this repo on the data
**UCI HAR Dataset.zip** obtained from the below indicated location. The data in the archive pertain to a set of 
experiments performed on volunteers using smartphone/accelerometers. The *readme.txt* file within the accompanying data archive 
provides a description of the experimental details.

### Context

**The archive location**

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**The experiments**

Human Activity Recognition Using Smartphones Dataset Version 1.0

**The investigation team**

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws  
www.smartlab.ws 

**Description**

The **UCI HAR Dataset.zip** archive includes a base folder with a **feature.txt**, **features.info**, and **activity_labels.txt** file.
The archive also includes two sub-folders labelled **test** and **train** that contain preprocessed and raw accelerometer data.
Each sub-folder (test/train) includes a folder **inertial_signals** containing raw data that is ignored by the script.
The sub-folders (test/train) also included pre-processed data files that provide input to the **run_analysis.R** script.

The files (in **train** folder) are described below. The description also applies to the **test** folder.

* **X_train.txt** --> each row in this file is an observation of volunteer/subject in multiple feature categories (columns)
* **subject_train.txt**--> each row in this file is a label mapping a subject to corresponding observation in X_train.txt.  
* **y_train.txt** --> each row in this file is an activity label mapping to corresponding observation in the X_train.txt.

The UCI HAR Dataset.zip archive includes the following text files in the base folder.

* **features.txt**--> each row is a label for the corresponding column in the X_train and X_test files.
* **feature.txt.info**--> is information regarding the feature labels
* **activity_labels.txt**--> provides a descriptive name for each activity with a mapping to the integer label in the y_[train/test].txt file.
* **README.txt** --> provides information regarding the data archive

## Function of the run_analysis.R script

The **run_analysis.R** script must be executed in the base folder of the extracted archive. This base directory 
must be the working directory in order for the various text files to be loaded correctly into R.

The script performs then following functions:

* loads into R the feature.txt labels and cleans up any illegal characters such as , ( ) -  from the label strings
* loads into R the observation data from the **X_[test/train].txt** files and then consolidates both into a single data frame
* inserts the feature names into the observations data frame as column labels
* loads into R the **y_[test/train].txt** files and then consolidates both into a single "activity" vector
* loads into R the **subject_[test/train].txt** files and then consolidates both into a single "subject" vector
* Replaces the integer labels in the "activity" vector with the descriptive mappings found in the **activity_labels.txt** file
* extracts from the observations data frame into new data frame **DF_mean_std** all columns with feature labels referring to "mean__" or "std__"
* merges the subject and activity vectors as the first two columns into **DF_mean_std**
* calculates in **DF_mean_std** for each subject/activity  the mean value for each feature column
* writes the **DF_mean_std** to a text file **tidyDataSet.txt** in the working directory
