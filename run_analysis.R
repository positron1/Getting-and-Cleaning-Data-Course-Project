#Load necessary packages
main<-function()
{
  library(reshape2)
  
  
  #Download and unzip data if needed
  
  
  #Read in data
  test_data<-read.table('UCI HAR Dataset/test/X_test.txt')
  test_subject<-read.table('UCI HAR Dataset/test/subject_test.txt')
  test_activity<-read.table('UCI HAR Dataset/test/y_test.txt')
  
  train_data<-read.table('UCI HAR Dataset/train/X_train.txt')
  train_subject<-read.table('UCI HAR Dataset/train/subject_train.txt')
  train_activity<-read.table('UCI HAR Dataset/train/y_train.txt')
  
  #Read in label
  label<-read.table('UCI HAR Dataset/activity_labels.txt')
  
  #Merge data from train and test
  subject<-rbind(test_subject,train_subject)
  activity<-rbind(test_activity,train_activity)
  data<-rbind(test_data,train_data)
  
  #Read in features
  features<-read.table('UCI HAR Dataset/features.txt')
  features<-as.character(features[[2]])
  label_name<-as.character(label[[2]])
  label_number<-as.numeric(label[[1]])
  
  names(data)<-features
  names(subject)<-'subject'
  names(activity)<-'activity'
  
  #Extract features with 'mean' and 'std'
  data<-subset(data, select = grep('mean\\(|std\\(',features))
  
  #Merge subject, activity and data
  data<-cbind(subject,activity,data)
  
  #Create tidy data
  data$subject<-as.factor(data$subject)
  data$activity<-factor(data$activity, levels = label_number, labels = label_name)
  
  molten<-melt(data, id = c('subject', 'activity'))
  tidy<-dcast(molten, subject + activity ~ variable, mean)
  
  #Write tidy data to a file
  write.table(tidy, 'tidyData.txt')
}

read_data<-function()
{
  tidy<-read.table('tidyData.txt', header = TRUE)
  str(tidy)
}