#codebook for the run_analysis code
Assumptions:
test and train have the same number of columns that can be named by features.

the activity numbers are represented in activity_labels

Variables
xTest- the file x-test.text
yTest- the file Y_test.txt
subTest-the file subject_test.txt
test- combined table with xtest ytest and subtest
xTrain- the file x-train.text
yTrain- the file y-train.text
subTrain- the file sub-train.text
train-combined table with xtrain ytrain and subtrain
vector that holds all the column names for the dataset
columnNames-table that holds all the column names for the dataset
columns-vector that holds only names and is transformed into characters
complete-merged train and test dataset, that gets columns as the column names
meancolnames-vector holding the names of mean() columns
stdcolnames-vector holding the names of the std() columns
meanstdcolnames-vector holding mean and std columns
meanstddata-table holding data from complete that has only mean or std columns
activities- table that holds the activity table
activitiesfactor-factor vector that holds activity labels
meanstddata$Activity- is transformed with activities factor labels 
completeMelt-melted meanstddata data set
dcastdata-a data frame with the averages of each variable for each subject and activity



