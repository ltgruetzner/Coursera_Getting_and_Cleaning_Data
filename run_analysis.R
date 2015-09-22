library(data.table)

## read and merge x_test.txt, y_test.txt and subject_test.txt

x.test<-read.table("x_test.txt")
y.test<-read.table("y_test.txt")
subject.test<-read.table("subject_test.txt")
names(subject.test)<-"SubjectID"
names(y.test)<-"Activity"
test<-cbind(subject.test,y.test,x.test)

## read and merge x_train.txt, y_train.txt and subject_train.txt

x.train<-read.table("x_train.txt")
y.train<-read.table("y_train.txt")
subject.train<-read.table("subject_train.txt")
names(subject.train)<-"SubjectID"
names(y.train)<-"Activity"
train<-cbind(subject.train,y.train,x.train)

## merge data sets test and train
data<-rbind(test,train)
data<-as.data.table(data)

## read names of features and select measurements on mean and std
fnames<-read.table("features.txt",stringsAsFactors = FALSE)
namesdata<-c("SubjectID","Activity",fnames$V2)
setnames(data,namesdata)
names<-grep("mean|std|SubjectID|Activity",names(data))
data<-data[,names,with=FALSE]
names(data)<-gsub("\\(\\)","",names(data))
names(data)<-gsub("-","_",names(data))

## add descriptive names for activities
data$Activity<-as.factor(data$Activity)
levels(data$Activity)<-c("WALKING", "WALKING_UP", "WALKING_DOWN", "SITTING", "STANDING", "LAYING")

## create new data set with the average of each variable for each activity and each subject
tidy<-data[,lapply(.SD,mean),by=c("SubjectID","Activity")]
tidy<-tidy[order(SubjectID,Activity)]

## write tidy data set
write.table(tidy,file="tidy.txt",row.names = FALSE)
