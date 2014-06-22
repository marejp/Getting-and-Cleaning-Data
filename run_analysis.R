library(reshape2)

## Read activity names
## Read the features find only mean() or std() values
## Remove any charaters that can cause later problems and make the lable
## more readable
activity.names <- read.table("./UCI HAR Dataset/activity_labels.txt")
headers <- read.table("./UCI HAR Dataset/features.txt")
valid.cols <- grepl("mean\\(\\)|std\\(\\)",headers[,2])
headers.clean <- headers[valid.cols,]
headers.clean <- gsub("-","",headers.clean[,2])
headers.clean <- gsub("mean\\(\\)","Mean",headers.clean)
headers.clean <- gsub("std\\(\\)","Std",headers.clean)

## Read all the train and test sets
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Merge the sets
merged.subject <- rbind(subject.train,subject.test)
merged.x <- rbind(x.train,x.test)
merged.y <- rbind(y.train,y.test)

## Only keep the valid column headers
merged.x <- merged.x[,valid.cols]
names(merged.x) <- headers.clean

merged.x.set <- cbind(merged.y,merged.subject,merged.x)
colnames(merged.x.set) <- c("activity","subject",headers.clean)
complete.set <- merge(merged.x.set,activity.names,by.x="activity",by.y="V1")
complete.set$activity <- NULL
complete.set <- complete.set[,c(68,1:67)]
colnames(complete.set) <- c("activity","subject",headers.clean)

## Reshape the data
samsungMelt <- melt(complete.set,id=c("activity","subject"))
subjectmean <- dcast(samsungMelt,activity + subject ~ variable,mean)
