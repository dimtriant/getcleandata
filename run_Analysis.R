##Retrieve the test data#####################################

# setwd("c:/UCI HAR Dataset/test")
# subject_test <- read.table("subject_test.txt")
# x_test <- read.table("X_test.txt")
# y_test <- read.table("y_test.txt")

##Retrieve the train data####################################

# setwd("c:/UCI HAR Dataset/train")
# subject_train <- read.table("subject_train.txt")
# x_train <- read.table("X_train.txt")
# y_train <- read.table("y_train.txt")

##Read activity labels & features############################

setwd("c:/UCI HAR Dataset")
act_labels <- read.table("activity_labels.txt")
feature_labels <- read.table("features.txt")

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

##Reduce both datasets to the columns relevant to mean and stdev

#test_dat_with_labels <- merge(test_dat,act_labels,by.x="activity_ID",by.y="V1")


##Merge the y_test & y_train datasets with the act_labels

#y_test_labels  <- merge(y_test,act_labels,by.x="activity_ID",by.y="V1",all=TRUE)

##Concatenate all data from test into a single dataframe. Do the same for train.

