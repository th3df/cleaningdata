# This script processes data in the UCI HAR Dataset.zip archive obtained from:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# To produce a tidy data set 

library(dplyr)

# Load the features into a dataframe and convert the names into strings
features<-read.table("features.txt")
columnnames<- as.character(features$V2)

# Replace all illegal characters: - , () with underscore _ 
for (i in 1:length(columnnames)) {
    columnnames[i]<-gsub("-", "_", columnnames[i])
    columnnames[i]<-gsub("\\,", "_", columnnames[i])
    columnnames[i]<-gsub("\\(", "_", columnnames[i])
    columnnames[i]<-gsub("\\)", "_", columnnames[i])
}

# load the observations from the test and training group into a data frame and give
# the columns labels obtained from the features.text file
x_test<-read.table("test/X_test.txt")
x_train<-read.table("train/X_train.txt")

# merge the rows from the test and training dataframes into one data frame
x_data<-rbind(x_test, x_train)

colnames(x_data)<- columnnames

# load the activity files into data frames and concatenate into one data frame 
y_test<-read.table("test/Y_test.txt")
y_train<-read.table("train/Y_train.txt")
y_data<-rbind(y_test, y_train)

# load the subject files into tables and concatenate into a single data frame
subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject_data<-rbind(subject_test, subject_train)

activity<-y_data$V1
subject<-subject_data$V1


# replace the integer codes in activity vector with the descriptive activity labels
for (i in 1:length(activity)) {
    if (activity[i] == 1) { activity[i]<- "WALKING" }
    if (activity[i] == 2) { activity[i]<- "WALKING_UPSTAIRS" }
    if (activity[i] == 3) { activity[i]<- "WALKING_DOWNSTAIRS" }
    if (activity[i] == 4) { activity[i]<- "SITTING" }
    if (activity[i] == 5) { activity[i]<- "STANDING" }
    if (activity[i] == 6) { activity[i]<- "LAYING" }
}

# merge the subject and activity vectors into the objervation data frame 
#as the first two columns

# extract the columns in x_data that have labels with "mean__" and "std__" in them 
# into a separate data frame
DF_mean_std<-cbind(subject, 
                   activity, 
                   x_data[,grepl("mean__", colnames(x_data))], 
                   x_data[,grepl("std__", colnames(x_data))])


# summarize by subject and activity allcolumns using the mean function
by_subj_activity<-DF_mean_std %>% 
    group_by(subject, activity) %>% 
    summarise_each(funs(mean))

# Write the tidy data set "by_subj_activity" into CSV text file
write.table(by_subj_activity, 
            file="tidyDataSet.txt", 
            quote=FALSE, 
            row.names=FALSE,
            sep=",")