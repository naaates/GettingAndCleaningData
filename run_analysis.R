#PROJECT- Data Cleaning

## Given:
## 10299 instances
## 70% training, 30% testing
## 561 features
## 30 subjects - 30 volunteers
## 6 Activity types - (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)


## --------------------- PART 1 ------------------------------------------------
#Reading and combining the x Test & Train text files
xtest = read.table("test/X_test.txt")
xtrain = read.table("train/X_train.txt")
x = rbind(xtest,xtrain)

#Reading and combining the y Test & Train text files
ytest = read.table("test/y_test.txt")
ytrain = read.table("train/y_train.txt")
y = rbind(ytest, ytrain)
#Rename column to "Activity"
names(y)="Activity_ID"

#Reading and combining the subject Test & Train text files
SubTest = read.table("test/subject_test.txt")
SubTrain = read.table("train/subject_train.txt")
Subjects = rbind(SubTest, SubTrain)
#Rename column to "Subject"
names(Subjects) = "Subject"


## --------------------- PART 2 ------------------------------------------------
#Read Features table 
features = read.table("features.txt")

#Extract "mean()" and "std()" Index Values only From Features
extractmean = grep("-mean\\(\\)", features$V2, ignore.case = TRUE)
extractstd = grep("-std\\(\\)", features$V2, ignore.case = TRUE)

length(extractmean)
length(extractstd)
#We got 33 mean and 33 std features = 66 extracted features

#Combine the mean and std index lists
ExtractedFeatures = append(extractmean, extractstd)

#Use the indexes to get the target features
FeatureNames = features[2][ExtractedFeatures,]

## --------------------- PART 3 ------------------------------------------------
#Read Activity Labels and assign it as row names
activity = read.table("activity_labels.txt")
activity

#Add another column Activity Label by matching the corresponding Activity ID
y$ActivityLabel = activity$V2[match(y$Activity_ID, activity$V1)]

#Delete the Activity_ID column to avoid conflicts for the aggregation in Part 5
y = subset(y, select = -Activity_ID)

## --------------------- PART 4 ------------------------------------------------
#Subset the x dataset using same index values as the extracted features
x = x[,ExtractedFeatures]

#Change column names of x with the 66 extracted featurenames
colnames(x) = FeatureNames

#Combine the 3 datasets into 1 Merged dataset
MergedDataset = cbind(x,y,Subjects)


## --------------------- PART 5 ------------------------------------------------
#Aggregate the first Dataset by getting the mean of the features per Subject then per Activity
NewDataset = aggregate(MergedDataset[ , 1:66], by = list(MergedDataset$Subject, MergedDataset$ActivityLabel), FUN = mean)

#Change column names of Group.1 and Group.2 to Subject and Activity
names(NewDataset)[names(NewDataset) == 'Group.1'] = 'Subject'
names(NewDataset)[names(NewDataset) == 'Group.2'] = 'Activity'

write.table(NewDataset, "New_Tidy_Dataset.txt", row.names=FALSE)


