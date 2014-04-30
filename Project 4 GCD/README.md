#readme for the run_analysis program
#Create the test data set by loading in and combining the X, Y and subject data
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subTest, yTest, xTest)

#Create the train data set by loading in and combining the X, Y and subject data
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
subTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subTrain, yTrain, xTrain)

#Create a vector that holds all the column names for the dataset
columnNames <- read.table("UCI HAR Dataset/features.txt")
columns <- columnNames[,2]
columns <- as.character(columns)
#create a complete set by merging the test and train together
complete <- rbind(test, train)
#add column names
colnames(complete) <- c("Subject", "Activity", c(columns))

#Find columns with mean and std and combine them into one vector
meancolnames <- grep("mean()", colnames(complete), fixed = TRUE)
stdcolnames <- grep("std()", colnames(complete), fixed = TRUE)
meanstdcolnames <- c(meancolnames, stdcolnames)
#select only the data from the main file that is mean or std
meanstddata <- complete[c(1,2, meanstdcolnames)]

#load activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#create an ordered factor for the activities
activitiesfactor <- factor(activities$V2, levels = unique(activities$V2), ordered = FALSE)
#replace numbers with activites in the main data set
meanstddata$Activity <- factor(meanstddata$Activity, labels = activitiesfactor)


#make a smaller data frame with only mean() and std()
completeMelt <- melt(meanstddata, id = c("Subject", "Activity"))

#create a data frame with the averages of each variable for each subject and activity
dcastdata <- dcast(completeMelt, Subject + Activity ~ variable,mean)

#Write the tidy data set out
write.table(dcastdata, "Project2TidyData.txt", sep="\t")

