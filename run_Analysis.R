#############################################################
###############Getting and Cleaning Data Project#############
#############################################################

##Retrieve the test data#####################################

setwd("c:/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

##Retrieve the train data####################################

setwd("c:/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

##Read activity labels & features############################

setwd("c:/UCI HAR Dataset")
act_labels <- read.table("activity_labels.txt")
feature_labels <- read.table("features.txt")
colnames(act_labels) <- c("activity_ID","activity_Name")

##Replace x_test & x_train labels with the feature labels

colnames(x_test) <- feature_labels[,2]
colnames(x_train) <- feature_labels[,2]

##Rename the y_test and y_train column to "activity_ID"#####

colnames(y_test) <- "activity_ID"
colnames(y_train) <- "activity_ID"

##Rename the subject_test & subject_train columnns into "subject_ID"

colnames(subject_test) <- "subject_ID"
colnames(subject_train) <- "subject_ID"

##Combine the subject,y,x datasets##########################

test_dat <- cbind(subject_test,y_test,x_test)
train_dat <- cbind(subject_train,y_train,x_train)

##Determine which columns contain the mean & stdev##########

col_select_test <-  grep(paste(c("mean","std"), collapse = "|"),colnames(test_dat))
col_select_test <- c(1,2,col_select_test)
col_select_train <-  grep(paste(c("mean","std"), collapse = "|"),colnames(test_dat))
col_select_train <- c(1,2,col_select_train)

##Remove columns with meanFreq labels######################

logic <- col_select_test %in% grep("meanFreq",colnames(test_dat))
col_select_test <- col_select_test[!logic]
logic <- col_select_train %in% grep("meanFreq",colnames(train_dat))
col_select_train <- col_select_train[!logic]

##Reduce both datasets to the columns relevant to mean and stdev

test_clean <- test_dat[,col_select_test]

train_clean <- train_dat[,col_select_train]

##Combine the test and train dataset with rbind()##########

data_clean <- rbind(test_clean,train_clean)

##Replace act_Labels with activity_Names in the data_clean dataset

data_clean_labels  <- merge(data_clean,act_labels,by.x="activity_ID",by.y="activity_ID",all=TRUE)
data_clean_labels$activity_ID <- NULL
data_clean_labels <- subset(data_clean_labels, select=c(68,1,2:67))

##Melt the data_clean_labels dataset#######################
library(reshape2)
data_melt <- melt(data_clean_labels, id=c("subject_ID","activity_Name"))

##Create a tidy summarizing dataset using dcast()
data_tidy <- dcast(data_melt,subject_ID + activity_Name~variable,mean)