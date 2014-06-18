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

##