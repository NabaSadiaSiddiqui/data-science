main <- function () {
  # Download the data set
  downloadData()
  # Load data
  data <- loadData()
  # Merge the training and test sets to create one data set
  mergedData <- mergeData(data)
  # Extract only the measurements on the mean ad standard deviation for each measurement
  parsedData <- reformData(mergedData)
  # Create a second, independent tidy data set with the average of each variable for each activity and each subject
  averagedDF <- averageData(parsedData)
  # Modify the second column of the data set to use activity labels instead of number
  DF <- addActivityNames(averagedDF, data$activityLabels)
  # Clean up
  cleanup()
  write.table(DF, file="result.txt")
}

# Download data
downloadData <- function() {
  destUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  tmpFile <- "out.zip"
  download.file(url=destUrl, destfile=tmpFile, mode="wb", method="curl")
  unzip(tmpFile)
  unlink(tmpFile)
}

# Load and return data from the folder "UCI HAR Dataset"
loadData <- function() {
  # Load features for each column and activitiy labels
  setwd("./UCI HAR Dataset")
  features <- read.table("features.txt")
  activityLabels <- read.table("activity_labels.txt")
  
  # Load data for test
  setwd("./test")
  testSubjects <- read.table(file="subject_test.txt")
  testSet <- read.table(file="X_test.txt")
  testLabels <- read.table(file="y_test.txt")
  
  # Load data for train
  setwd("../train")
  trainSubjects <- read.table(file="subject_train.txt")
  trainSet <- read.table(file="X_train.txt")
  trainLabels <- read.table(file="y_train.txt")
  
  # Return to root of workspace
  setwd("../../")
  
  return(list("testSubjects" = testSubjects, "testSet" = testSet, "testLabels" = testLabels, "trainSubjects" = trainSubjects, "trainSet" = trainSet, "trainLabels" = trainLabels, "features" = features, "activityLabels" = activityLabels))
}

# Merges the various components of data to form one data set and returns the new, merged data set
mergeData <- function(data) {
  # Clip together different observations for each of train and set data 
  # [participant number (1-30)] [activity performed (1-6)] [data]
  colnames(data$testSubjects) <- c("Subject-ID")
  colnames(data$testSet) <- data$features[,2]
  colnames(data$testLabels) <- c("Activity")
  testDat <- cbind(data$testSubjects, data$testLabels, data$testSet)
  #-----#
  colnames(data$trainSubjects) <- c("Subject-ID")
  colnames(data$trainSet) <- data$features[,2]
  colnames(data$trainLabels) <- c("Activity")
  trainDat <- cbind(data$trainSubjects, data$trainLabels, data$trainSet)
  
  # Merge the training and test sets to create one data set
  mergedData <- rbind(testDat, trainDat)
  
  return(mergedData)
}

# Extracts the mean and standard deviation for each measurement and return the new data set
reformData <- function (data) {
  parsedData <- data[c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 545:545)]
  return(parsedData)
}

# Create and return an independent tidy data set with the average of each variable for each activity and each subject
averageData <- function (data) {
  splitPerActivityType <- split(data, f=data[,"Activity"])
  DF <- data.frame()
  for(el in splitPerActivityType) {
    splitPerSubject <- split(el, f=el[,"Subject-ID"])
    
    for(el in splitPerSubject) {
      avg <- as.data.frame(matrix(colMeans(el),1))
      DF <- rbind(DF, avg)
    }
  }
  colnames(DF) <- colnames(data)
  
  return(DF)
}

# Modifies the data set to use descriptive activity names to name the activities
addActivityNames <- function(data, activityLabels) {
  activityList <- as.character(activityLabels[,2])
  activity <- 1
  while(activity <= nrow(data)) {
    index <- which(data[,"Activity"] == activity)
    data[index, "Activity"] <- activityList[activity]
    activity <- activity + 1
  }
  return(data)
}

# Remove the unzipped director
cleanup <- function() {
  unlink("UCI HAR Dataset", recursive = TRUE, force = TRUE)
}
