library(dplyr)
library(magrittr)

## First thing is to read all the data sets into R. I am assuming the  
## UCI Har Dataset folder is in the working directory and contains the files

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Add column headers

names(Xtrain) <- features[,2]
names(Xtest) <- features[,2]

## Now add the subject and activity columns to each of train and test
## Label the columns we have added, merge the data and subset for mean 
## and std in the variable names

Train_table <- cbind(subjecttrain,ytrain,Xtrain)
colnames(Train_table)[1:2] <- c("subject","activity_number")

Test_table <- cbind(subjecttest,ytest,Xtest)
colnames(Test_table)[1:2] <- c("subject","activity_number")

total <- rbind(Train_table,Test_table)
total <- cbind(total[1:2],total[,grepl("mean",names(total)) | grepl("std",names(total))])

## add column with descriptive activity names

names(activity_labels) <- c("activity_number","activity")
total <- join(total2,activity_labels,by='activity_number')

## summarise by subject and activity and write to working directory

summary <- total %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(summary, file = "weekfoursummary.txt",row.name=FALSE)
