#Install Packages
library(plyr)
setwd("/Users/emkarson/Documents/coursera/getting and cleaning data/data/UCI HAR Dataset")
#Import Variable Names
varnames<-read.table("features.txt", quote="\"", comment.char="")
varnames1<-as.character(varnames$V2)

#Import Data for test subjects
y_test <- read.table("test/y_test.txt", quote="\"", comment.char="")
x_test <- read.table("test/X_test.txt", quote="\"", comment.char="")
subject_test <- read.table("test/subject_test.txt", quote="\"", comment.char="")
names(x_test)<-varnames1 #Apply appropriate variable names

#Import Data for train subjects
y_train <- read.table("train/y_train.txt", quote="\"", comment.char="")
x_train <- read.table("train/X_train.txt", quote="\"", comment.char="")
subject_train <- read.table("train/subject_train.txt", quote="\"", comment.char="")
names(x_train)<-varnames1 #Apply appropriate variable names

#Merge testing data together
test<-cbind(subject_test,y_test,x_test)
test<-cbind(test,TRUE)

#Merge training data together
train<-cbind(subject_train,y_train,x_train)
train<-cbind(train,FALSE)

names(test)<-names(train)

#Row-bind testing and training data together
working<-rbind(test,train)

#Modify variable names
names(working)[1]<-"subject"
names(working)[2]<-"activity"
names(working)[564]<-"test"

#Extract only variables with mean and standard deviation summary statistics
meanindx<-grep("mean",names(working))
stdindx<-grep("std",names(working))

indx<-c(meanindx,stdindx)
indx<-indx[order(indx)]

working1<-working[,c(1,2,indx,564)]

#Assign factor levels based on codebook
working1$activity<-factor(working1$activity)
levels(working1$activity)[levels(working1$activity)=="1"] <- "walking"
levels(working1$activity)[levels(working1$activity)=="2"] <- "walking_upstairs"
levels(working1$activity)[levels(working1$activity)=="3"] <- "walking_downstairs"
levels(working1$activity)[levels(working1$activity)=="4"] <- "sitting"
levels(working1$activity)[levels(working1$activity)=="5"] <- "standing"
levels(working1$activity)[levels(working1$activity)=="6"] <- "laying"

#Extract just variables with mean summary statistics
meanindx2<-grep("mean",names(working1))
indx2<-c(1,2,meanindx2,82)
working2<-working1[,indx2]

#Export Tidy-Data
write.csv(working1,file="tidy_data_mean_std.csv",col.names = TRUE)
write.csv(working2,file="tidy_data_mean_only.csv",col.names = TRUE)

write.table(working2,file="tidy_data_mean_only.txt",row.names=FALSE)

