## Place the UCI HAR Dataset into your working directory
library(reshape2)

# Read tables
features <- read.table("./UCI HAR Dataset/features.txt", sep = "")
features <- as.character(t(features[,2]))   ## Transposes table and converts descriptive variable names class from factor to character
features <- gsub("-", ".", features)
HAR_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header=FALSE)
HAR_train[,562] <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "", header=FALSE)
HAR_train[,563] = read.table("./UCI HAR Dataset/train/y_train.txt", sep = "", header=FALSE)
HAR_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header=FALSE)
HAR_test[,562] <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "", header=FALSE)
HAR_test[,563] <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "", header=FALSE)

# Bind tables
HAR_colnames <- c(features,"subject","activity")
HAR_dataset <- rbind(HAR_train, HAR_test)

# Gives column names to dataset
colnames(HAR_dataset) <- HAR_colnames

# Label activities
HAR_dataset$activity[HAR_dataset$activity == 1] <- "WALKING"
HAR_dataset$activity[HAR_dataset$activity == 2] <- "WALKING UPSTAIRS"
HAR_dataset$activity[HAR_dataset$activity == 3] <- "WALKING DOWNSTAIRS"
HAR_dataset$activity[HAR_dataset$activity == 4] <- "SITTING"
HAR_dataset$activity[HAR_dataset$activity == 5] <- "STANDING"
HAR_dataset$activity[HAR_dataset$activity == 6] <- "LAYING"

# Change activity class from character to factor
HAR_dataset$activity <- as.factor(HAR_dataset$activity)
# Keeps only subject, activity, mean, and stdev columns
HAR_dataset <- HAR_dataset[,c(grep(c("mean\\(|std\\("), HAR_colnames),562,563)]

# Melt dataset
HAR_melt <- melt(HAR_dataset, id.vars = c("subject","activity"), variable.name = "signal",value.name = "measurement")

# Average measurements by subject and activity
HAR_tidy <- aggregate(. ~ subject + activity + signal, data=HAR_melt, FUN=mean)
write.table(HAR_tidy, "./HAR_tidy.txt", row.names = FALSE)