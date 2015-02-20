# The following code will product a tidy data set
# Please see the markdown files for full descriptions

tidySet <- function() {
    
    features <- read.table("./UCI HAR Dataset/features.txt")
    meanandsd <- features$V1[grepl("-mean()",features$V2,fixed=TRUE)|grepl("-std()",features$V2,fixed=TRUE)]
    labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("AID","Activity"))
    
    train1 <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="Subject")
    train2 <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="AID")
    train3 <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$V2)
    train3 <- train3[,meanandsd]
    train <- cbind(train1,train2,train3)
    
    test1 <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="Subject")
    test2 <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="AID")
    test3 <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$V2)
    test3 <- test3[,meanandsd]
    test <- cbind(test1,test2,test3)
    
    alldata <- rbind(train,test)
    alldata <- merge(labels,alldata)
    alldata$AID <- NULL
    
    alldata2 <- aggregate(alldata[,3:ncol(alldata)],by=alldata[,1:2],FUN=mean)
    write.table(alldata2,file="meandata.txt",row.name=FALSE)

}