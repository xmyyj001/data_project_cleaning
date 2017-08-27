## prepare the enviroment and load the R package needed.
library(dplyr)
setwd("C:/Users/admin/Downloads/DATA Science/datacleaning track")

## step 0-1: download zip file from website
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./UCI HAR Dataset.zip")

## step 0-2: unzip data
listZip <- unzip("./UCI HAR Dataset.zip")
setwd("./UCI HAR Dataset")

# 1. Merge the training and the test sets to create one data set.
## step 1-1: load data into R
train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")

## step 1-2: merge train and test data
trainData <- cbind(train.subject, train.y, train.x)
testData <- cbind(test.subject, test.y, test.x)
fullData <- rbind(trainData, testData)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

## step 2-1: load feature name into R
featureName <- read.table("./features.txt", stringsAsFactors = FALSE)[,2]

## step 2-2:  extract mean and standard deviation of each measurements
featureIndex <- grep(("mean\\(\\)|std\\(\\)"), featureName)
finalData <- fullData[, c(1, 2, featureIndex+2)]
colnames(finalData) <- c("subject", "activity", featureName[featureIndex])


# 3. Uses descriptive activity names to name the activities in the data set

## step 3-1: load activity data into R
activityName <- read.table("./activity_labels.txt")

## step 3-2: replace 1 to 6 with activity names
finalData$activity <- factor(finalData$activity, levels = activityName[,1], labels = activityName[,2])


# 4. Appropriately labels the data set with descriptive variable names.

names(finalData) <- gsub("\\()", "", names(finalData))
names(finalData) <- gsub("^t", "time", names(finalData))
names(finalData) <- gsub("^f", "frequence", names(finalData))
names(finalData) <- gsub("-mean", "Mean", names(finalData))
names(finalData) <- gsub("-std", "Std", names(finalData))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

groupData <- finalData %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))

write.table(groupData, "./Meandata.txt", row.names = FALSE)
