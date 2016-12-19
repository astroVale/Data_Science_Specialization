# Source of data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 1. Reads and merges the training and the test sets to create one data set.

Xtrain <- read.table("./train/X_train.txt")
Xtest <- read.table("./test/X_test.txt")
sets <- rbind(Xtrain,Xtest)

sub_train <- read.table("./train/subject_train.txt", col.names="subject" )
sub_test <- read.table("./test/subject_test.txt", col.names="subject")
subjects <- rbind(sub_train,sub_test)

Ytrain <- read.table("./train/y_train.txt", col.names="label")
Ytest <- read.table("./test/y_test.txt", col.names="label")
labels <- rbind(Ytrain,Ytest)

merged <- cbind(subjects,labels, sets)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]
data_mean_std <- merged[, c(1, 2, features_mean_std$V1+2)]


# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
data_mean_std$label <- activities[data_mean_std$label, 2]


# 4. Appropriately labels the data set with descriptive activity names.

colnames(data_mean_std) <- c("subject", "label", features_mean_std$V2)
colnames(data_mean_std) <- tolower(gsub("\\(|\\)", "", names(data_mean_std)))


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

aggr.data <- aggregate(data_mean_std[, 3:ncol(data_mean_std)],
                       by=list(subject = data_mean_std$subject, 
                               label = data_mean_std$label),
                       mean)

write.table(format(aggr.data, scientific=TRUE), "tidy.txt",
            row.names=FALSE, col.names=FALSE, quote=2)